LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_8_bit_tb IS
END full_adder_8_bit_tb;

ARCHITECTURE behavior OF full_adder_8_bit_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT full_adder_8bit
    PORT(
         A    : IN  std_logic_vector(7 downto 0);
         B    : IN  std_logic_vector(7 downto 0);
         CIN  : IN  std_logic;
         SUM  : OUT std_logic_vector(7 downto 0);
         COUT : OUT std_logic
        );
    END COMPONENT;

    -- Inputs
    signal A   : std_logic_vector(7 downto 0) := (others => '0');
    signal B   : std_logic_vector(7 downto 0) := (others => '0');
    signal CIN : std_logic := '0';

    -- Outputs
    signal SUM  : std_logic_vector(7 downto 0);
    signal COUT : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: full_adder_8bit PORT MAP (
        A    => A,
        B    => B,
        CIN  => CIN,
        SUM  => SUM,
        COUT => COUT
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 1: 0 + 0 + 0
        A <= "00000000";
        B <= "00000000";
        CIN <= '0';
        wait for 100 ns;

        -- Test 2: 1 + 1 + 0
        A <= "00000001";
        B <= "00000001";
        CIN <= '0';
        wait for 100 ns;

        -- Test 3: 15 + 1 + 0
        A <= "00001111";
        B <= "00000001";
        CIN <= '0';
        wait for 100 ns;

        -- Test 4: 170 + 85 + 0
        A <= "10101010";
        B <= "01010101";
        CIN <= '0';
        wait for 100 ns;

        -- Test 5: 255 + 1 + 0
        A <= "11111111";
        B <= "00000001";
        CIN <= '0';
        wait for 100 ns;

        -- Test 6: 255 + 255 + 0
        A <= "11111111";
        B <= "11111111";
        CIN <= '0';
        wait for 100 ns;

        -- Test 7: 0 + 0 + 1
        A <= "00000000";
        B <= "00000000";
        CIN <= '1';
        wait for 100 ns;

        -- Test 8: 255 + 0 + 1
        A <= "11111111";
        B <= "00000000";
        CIN <= '1';
        wait for 100 ns;

        -- Test 9: 204 + 51 + 1
        A <= "11001100";
        B <= "00110011";
        CIN <= '1';
        wait for 100 ns;

        -- Stop simulation
        wait;

    end process;

END behavior;