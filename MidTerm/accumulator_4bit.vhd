library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity accumulator_4bit is
    Port (
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR(3 downto 0)
    );
end accumulator_4bit;

architecture Structural of accumulator_4bit is

    signal SUM : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- 4-bit Adder
    U1: entity work.adder_4bit(Dataflow)
        port map (
            A   => A,
            B   => B,
            SUM => SUM
        );

    -- 4-bit Register
    U2: entity work.register_4bit(Behavioral)
        port map (
            CLK   => CLK,
            RESET => RESET,
            D     => SUM,
            Q     => Q
        );

end Structural;