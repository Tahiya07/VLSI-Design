
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterBank is
    Port (
        CLK      : in  STD_LOGIC;
        RESET    : in  STD_LOGIC;
        ACC_Load : in  STD_LOGIC;
        R_Load   : in  STD_LOGIC;
        ACC_Data : in  STD_LOGIC_VECTOR(7 downto 0);
        ACC_Out  : out STD_LOGIC_VECTOR(7 downto 0);
        R_Out    : out STD_LOGIC_VECTOR(7 downto 0);
        Z_Out    : out STD_LOGIC
    );
end RegisterBank;

architecture Behavioral of RegisterBank is

    signal ACC_reg : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal R_reg   : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal Z_reg   : STD_LOGIC := '1';

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                ACC_reg <= x"00";
                R_reg   <= x"00";
                Z_reg   <= '1';
            else
                if R_Load = '1' then
                    R_reg <= ACC_reg;
                end if;

                if ACC_Load = '1' then
                    ACC_reg <= ACC_Data;

                    if ACC_Data = x"00" then
                        Z_reg <= '1';
                    else
                        Z_reg <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

    ACC_Out <= ACC_reg;
    R_Out   <= R_reg;
    Z_Out   <= Z_reg;

end Behavioral;