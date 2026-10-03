library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_accumulator_4bit is
end tb_accumulator_4bit;

architecture Behavioral of tb_accumulator_4bit is

    signal A     : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal B     : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '0';
    signal Q     : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the accumulator
    DUT: entity work.accumulator_4bit(Structural)
        port map (
            A     => A,
            B     => B,
            CLK   => CLK,
            RESET => RESET,
            Q     => Q
        );

    -- Clock generation
    CLK <= not CLK after 5 ns;

    -- Test sequence
    process
    begin

        -- Step 1: Reset
        RESET <= '1';
        A <= "0000";
        B <= "0000";

        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = "0000"
            report "Step 1 FAILED: Reset"
            severity error;

        -- Step 2: 3 + 5 = 8
        RESET <= '0';
        A <= "0011";
        B <= "0101";

        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = "1000"
            report "Step 2 FAILED: 3 + 5"
            severity error;

        -- Step 3: 2 + 1 = 3
        A <= "0010";
        B <= "0001";

        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = "0011"
            report "Step 3 FAILED: 2 + 1"
            severity error;

        -- Step 4: 15 + 1 = 16 -> 0000
        A <= "1111";
        B <= "0001";

        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = "0000"
            report "Step 4 FAILED: 15 + 1"
            severity error;

        -- Step 5: 10 + 5 = 15
        A <= "1010";
        B <= "0101";

        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = "1111"
            report "Step 5 FAILED: 10 + 5"
            severity error;

        report "All test cases completed successfully."
            severity note;

        wait;

    end process;

end Behavioral;