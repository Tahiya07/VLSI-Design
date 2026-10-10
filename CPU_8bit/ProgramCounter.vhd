
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ProgramCounter is
    Port (
        CLK     : in  STD_LOGIC;
        RESET   : in  STD_LOGIC;
        PC_next : in  STD_LOGIC_VECTOR(3 downto 0);
        PC_out  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end ProgramCounter;

architecture Behavioral of ProgramCounter is

    signal PC_reg : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                PC_reg <= "0000";
            else
                PC_reg <= PC_next;
            end if;
        end if;
    end process;

    PC_out <= PC_reg;

end Behavioral;