
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU_8bit_tb is
end CPU_8bit_tb;

architecture behavior of CPU_8bit_tb is

    component CPU_8bit
        Port (
            CLK     : in  STD_LOGIC;
            RESET   : in  STD_LOGIC;
            Q       : out STD_LOGIC_VECTOR(7 downto 0);
            Z       : out STD_LOGIC;
            PC      : out STD_LOGIC_VECTOR(3 downto 0);
            R_Value : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal CLK     : STD_LOGIC := '0';
    signal RESET   : STD_LOGIC := '1';
    signal Q       : STD_LOGIC_VECTOR(7 downto 0);
    signal Z       : STD_LOGIC;
    signal PC      : STD_LOGIC_VECTOR(3 downto 0);
    signal R_Value : STD_LOGIC_VECTOR(7 downto 0);

    constant CLK_period : time := 10 ns;

begin

    -- Instantiate the CPU
    uut: CPU_8bit
        port map (
            CLK     => CLK,
            RESET   => RESET,
            Q       => Q,
            Z       => Z,
            PC      => PC,
            R_Value => R_Value
        );

    -- Generate the clock
    CLK_process : process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_period / 2;
            CLK <= '1';
            wait for CLK_period / 2;
        end loop;
    end process;

    -- Reset, execute the program, and verify the result
    stim_proc : process
    begin
        -- Keep reset active across rising edges
        RESET <= '1';
        wait for 20 ns;

        -- Release reset on a falling edge
        wait until falling_edge(CLK);
        RESET <= '0';

        -- Allow eight instructions to execute
        wait for 80 ns;
        wait for 1 ns;

        -- Verify final state
        assert Q = x"FA"
            report "FAIL: Q should equal FA"
            severity error;

        assert R_Value = x"5A"
            report "FAIL: R_Value should equal 5A"
            severity error;

        assert PC = "1000"
            report "FAIL: PC should equal 8"
            severity error;

        assert Z = '0'
            report "FAIL: Z should equal 0"
            severity error;

        assert false
            report "Simulation checks completed"
            severity note;

        wait;
    end process;

end behavior;