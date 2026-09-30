library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        CIN  : in  STD_LOGIC;
        SUM  : out STD_LOGIC;
        COUT : out STD_LOGIC
    );
end full_adder;

architecture Dataflow of full_adder is
begin

    SUM  <= A XOR B XOR CIN;
    COUT <= (A AND B) OR (B AND CIN) OR (A AND CIN);

end Dataflow;