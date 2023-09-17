--==============================================================================================
--				                    ULA - 8 BITS
--==============================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity ULA8 is
    port (  A,B : in std_logic_vector(7 downto 0);
            K : in std_logic_vector(3 downto 0);
            Co: out std_logic;
            Z: out std_logic;
            O: out std_logic_vector(7 downto 0));
end ULA8;

architecture ckt of ULA8 is

    component MUX16X1_8B is -- MULTIPLEXADOR 16X1 8 BITS
        port(i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15 : in std_logic_vector(7 downto 0);
             s : in std_logic_vector(3 downto 0);
             q : out std_logic_vector(7 downto 0));
    end component;

    component ADD8 is --SOMADOR
        port (A, B : in std_logic_vector(7 downto 0);
                Ci : in std_logic;
                Co : out std_logic;
                S : out std_logic_vector(7 downto 0));
    end component;

    component OPR_AND is --AND
        port (A, B : in std_logic_vector(7 downto 0);
                S : out std_logic_vector(7 downto 0);
                Z : out std_logic);
    end component;

    component OPR_NOT is --NOT
        port (A : in std_logic_vector(7 downto 0);
                S : out std_logic_vector(7 downto 0);
                Z : out std_logic);
    end component;

    component OPR_OR is --OR
        port (A, B : in std_logic_vector(7 downto 0);
                S : out std_logic_vector(7 downto 0);
                Z : out std_logic);
    end component;

    component OPR_XOR is --XOR
        port (A, B : in std_logic_vector(7 downto 0);
                S : out std_logic_vector(7 downto 0);
                Z : out std_logic);
    end component;
    
    component SUB8 is --SUBTRATOR
        port (A, B : in std_logic_vector(7 downto 0);
                Ti : in std_logic;
                Tout : out std_logic;
                S : out std_logic_vector(7 downto 0));
    end component;

    component SWA8 is --SWAP ALL
        port (A : in std_logic_vector(7 downto 0);
                S : out std_logic_vector(7 downto 0));
    end component;

    component SWP is --SWAP PARCIAL
        port (  A : in std_logic_vector(7 downto 0);
                S : out std_logic_vector(7 downto 0));
    end component;

    component BARREL_R is --DESLOCADOR A DIREITA
        port (S : in std_logic_vector(2 downto 0);
                I : in std_logic_vector(7 downto 0);
                Y : out std_logic_vector(7 downto 0));
    end component;

    component BARREL_L is --DESLOCADOR A ESQUERDA
        port (S : in std_logic_vector(2 downto 0);
                I : in std_logic_vector(7 downto 0);
                Y : out std_logic_vector(7 downto 0));
    end component;

    component MUX16B is --MULTIPLEXADOR 16BITS
        port(i : in std_logic_vector(15 downto 0);
             s : in std_logic_vector(3 downto 0);
             q : out std_logic);
    end component;

    component MULT is --MULTIPLICADOR
        port(A, B : in std_logic_vector(7 downto 0);
                Co : out std_logic;
                S : out std_logic_vector(7 downto 0));
    end component;

    signal 
        ADD8C,SUBTC,MULTC,INCC,DECC,SHLC: std_logic;

    signal
        ADD8S1,SUBTS1,MULTS1,INCS1,DECS1,SHLS1,SHRS1,SWPS1,SWAS1,ANDS1,ORS1,XORS1,NOTS1,SO: std_logic_vector(7 downto 0);

    signal
        VCARRY: std_logic_vector(15 downto 0);


begin
--////////////////////COMPONENTES/////////////////////--
    ADD: ADD8 port map(A,B,'0',ADD8C,ADD8S1);
    SUBTT: SUB8 port map(A,B,'0',SUBTC,SUBTS1);
    MULTT: MULT port map(A,B,MULTC,MULTS1);
    INC: ADD8 port map(A,"00000001",'0',INCC,INCS1);
    DEC: SUB8 port map(A,"00000001",'0',DECC,DECS1);
    SHLL: BARREL_L port map(B(2 downto 0),A,SHLS1);
    SHLC <= SHLS1(7);
    SHRR: BARREL_R port map(B(2 downto 0),A,SHRS1);
    SWPP: SWP port map(A,SWPS1);
    SWAA: SWA8 port map(A,SWAS1);
    ANDD: OPR_AND port map (A,B,ANDS1);
    ORR: OPR_OR port map (A,B,ORS1);
    XORR: OPR_XOR port map (A,B,XORS1);
    NOTT: OPR_NOT port map (A,NOTS1);
--///////////////END COMPONENTES///////////////////--

    MUX: MUX16X1_8B port map ("00000000",ADD8S1,SUBTS1,MULTS1,INCS1,DECS1,"00000000","00000000",SHLS1,SHRS1,SWPS1,SWAS1,ANDS1,ORS1,XORS1,NOTS1,K,SO);
    
    O<=SO;

    VCARRY <= ("0000000"& SHLC &'0'&'0' & DECC & INCC & MULTC & SUBTC & ADD8C & '0');

    MUXCARRY: MUX16B port map (VCARRY,K,Co);
      
    Z <= ((SO(7) nor SO(6)) nor (SO(5) nor SO(4))) nor ((SO(3) nor SO(2)) nor (SO(1) nor SO(0)));


end ckt;

