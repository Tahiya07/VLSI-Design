LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_tb IS
END full_adder_tb;

ARCHITECTURE behavior OF full_adder_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT full_adder
    PORT(
         A    : IN  std_logic;
         B    : IN  std_logic;
         CIN  : IN  std_logic;
         SUM  : OUT std_logic;
         COUT : OUT std_logic
        );
    END COMPONENT;

    -- Inputs
    signal A   : std_logic := '0';
    signal B   : std_logic := '0';
    signal CIN : std_logic := '0';

    -- Outputs
    signal SUM  : std_logic;
    signal COUT : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: full_adder PORT MAP (
        A    => A,
        B    => B,
        CIN  => CIN,
        SUM  => SUM,
        COUT => COUT
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- 000
        A <= '0';
        B <= '0';
        CIN <= '0';
        wait for 100 ns;

        -- 001
        A <= '0';
        B <= '0';
        CIN <= '1';
        wait for 100 ns;

        -- 010
        A <= '0';
        B <= '1';
        CIN <= '0';
        wait for 100 ns;

        -- 011
        A <= '0';
        B <= '1';
        CIN <= '1';
        wait for 100 ns;

        -- 100
        A <= '1';
        B <= '0';
        CIN <= '0';
        wait for 100 ns;

        -- 101
        A <= '1';
        B <= '0';
        CIN <= '1';
        wait for 100 ns;

        -- 110
        A <= '1';
        B <= '1';
        CIN <= '0';
        wait for 100 ns;

        -- 111
        A <= '1';
        B <= '1';
        CIN <= '1';
        wait for 100 ns;

        wait;

    end process;

END behavior;