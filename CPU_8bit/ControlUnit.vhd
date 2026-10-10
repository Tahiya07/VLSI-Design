
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port (
        opcode  : in  STD_LOGIC_VECTOR(3 downto 0);
        ACC_Load : out STD_LOGIC;
        R_Load   : out STD_LOGIC;
        ALU_Sel  : out STD_LOGIC_VECTOR(1 downto 0)
    );
end ControlUnit;

architecture Behavioral of ControlUnit is
begin

    process(opcode)
    begin
        -- Default: unsupported instruction behaves as NOP
        ACC_Load <= '0';
        R_Load   <= '0';
        ALU_Sel  <= "00";

        case opcode is

            when "0001" =>  -- LDI
                ACC_Load <= '1';
                ALU_Sel  <= "00";

            when "0010" =>  -- ADD
                ACC_Load <= '1';
                ALU_Sel  <= "01";

            when "0011" =>  -- SUB
                ACC_Load <= '1';
                ALU_Sel  <= "10";

            when "1010" =>  -- STA
                R_Load <= '1';

            when "1011" =>  -- LDR
                ACC_Load <= '1';

            when others =>
                null;

        end case;
    end process;

end Behavioral;