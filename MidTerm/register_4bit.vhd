library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_4bit is
    Port (
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        D     : in  STD_LOGIC_VECTOR(3 downto 0);
        Q     : out STD_LOGIC_VECTOR(3 downto 0)
    );
end register_4bit;

architecture Behavioral of register_4bit is
    signal Q_reg : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                Q_reg <= "0000";
            else
                Q_reg <= D;
            end if;
        end if;
    end process;

    Q <= Q_reg;

end Behavioral;