/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/VLSI_projects/Project/CPU_8bit/CPU_8bit_tb.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_13554554585326073636_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0195831693_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3104U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng0);

LAB4:    if ((unsigned char)1 != 0)
        goto LAB5;

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 3752);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2912);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;

LAB1:    return;
LAB6:;
LAB8:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 3752);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(50, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2912);
    xsi_process_wait(t2, t8);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    goto LAB4;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

}

static void work_a_0195831693_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    unsigned char t8;
    unsigned int t9;
    char *t10;
    unsigned char t12;

LAB0:    t1 = (t0 + 3352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 3816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(59, ng0);
    t7 = (20 * 1000LL);
    t2 = (t0 + 3160);
    xsi_process_wait(t2, t7);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(62, ng0);

LAB10:    t2 = (t0 + 3672);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    t4 = (t0 + 3672);
    *((int *)t4) = 0;
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 3816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(66, ng0);
    t7 = (80 * 1000LL);
    t2 = (t0 + 3160);
    xsi_process_wait(t2, t7);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    t3 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_13554554585326073636_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t8 == 1)
        goto LAB8;
    else
        goto LAB10;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(67, ng0);
    t7 = (1 * 1000LL);
    t2 = (t0 + 3160);
    xsi_process_wait(t2, t7);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 6016);
    t8 = 1;
    if (8U == 8U)
        goto LAB22;

LAB23:    t8 = 0;

LAB24:    if (t8 == 0)
        goto LAB20;

LAB21:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t2 = (t0 + 6047);
    t8 = 1;
    if (8U == 8U)
        goto LAB30;

LAB31:    t8 = 0;

LAB32:    if (t8 == 0)
        goto LAB28;

LAB29:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6084);
    t8 = 1;
    if (4U == 4U)
        goto LAB38;

LAB39:    t8 = 0;

LAB40:    if (t8 == 0)
        goto LAB36;

LAB37:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t8 = *((unsigned char *)t3);
    t12 = (t8 == (unsigned char)2);
    if (t12 == 0)
        goto LAB44;

LAB45:    xsi_set_current_line(86, ng0);
    if ((unsigned char)0 == 0)
        goto LAB46;

LAB47:    xsi_set_current_line(90, ng0);

LAB50:    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    t10 = (t0 + 6024);
    xsi_report(t10, 23U, (unsigned char)2);
    goto LAB21;

LAB22:    t9 = 0;

LAB25:    if (t9 < 8U)
        goto LAB26;
    else
        goto LAB24;

LAB26:    t5 = (t3 + t9);
    t6 = (t2 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB23;

LAB27:    t9 = (t9 + 1);
    goto LAB25;

LAB28:    t10 = (t0 + 6055);
    xsi_report(t10, 29U, (unsigned char)2);
    goto LAB29;

LAB30:    t9 = 0;

LAB33:    if (t9 < 8U)
        goto LAB34;
    else
        goto LAB32;

LAB34:    t5 = (t3 + t9);
    t6 = (t2 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB31;

LAB35:    t9 = (t9 + 1);
    goto LAB33;

LAB36:    t10 = (t0 + 6088);
    xsi_report(t10, 23U, (unsigned char)2);
    goto LAB37;

LAB38:    t9 = 0;

LAB41:    if (t9 < 4U)
        goto LAB42;
    else
        goto LAB40;

LAB42:    t5 = (t3 + t9);
    t6 = (t2 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB39;

LAB43:    t9 = (t9 + 1);
    goto LAB41;

LAB44:    t2 = (t0 + 6111);
    xsi_report(t2, 22U, (unsigned char)2);
    goto LAB45;

LAB46:    t2 = (t0 + 6133);
    xsi_report(t2, 27U, (unsigned char)0);
    goto LAB47;

LAB48:    goto LAB2;

LAB49:    goto LAB48;

LAB51:    goto LAB49;

}


extern void work_a_0195831693_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0195831693_2372691052_p_0,(void *)work_a_0195831693_2372691052_p_1};
	xsi_register_didat("work_a_0195831693_2372691052", "isim/CPU_8bit_tb_isim_beh.exe.sim/work/a_0195831693_2372691052.didat");
	xsi_register_executes(pe);
}
