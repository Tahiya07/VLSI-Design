
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        ACC        : in  STD_LOGIC_VECTOR(7 downto 0);
        IMM        : in  STD_LOGIC_VECTOR(7 downto 0);
        ALU_Sel    : in  STD_LOGIC_VECTOR(1 downto 0);
        ALU_Result : out STD_LOGIC_VECTOR(7 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
begin

    process(ACC, IMM, ALU_Sel)
    begin
        case ALU_Sel is

            when "00" =>
                ALU_Result <= IMM;  -- LDI: pass immediate

            when "01" =>
                ALU_Result <= std_logic_vector(
                    unsigned(ACC) + unsigned(IMM)
                );  -- ADD

            when "10" =>
                ALU_Result <= std_logic_vector(
                    unsigned(ACC) - unsigned(IMM)
                );  -- SUB

            when others =>
                ALU_Result <= ACC;  -- Default: hold current value

        end case;
    end process;

end Behavioral;