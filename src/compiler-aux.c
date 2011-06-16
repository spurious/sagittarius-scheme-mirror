/* This file is automatically generated. DO NOT EDIT!*/
#define LIBSAGITTARIUS_BODY
#include "sagittarius.h"
#define WORD(x)       SG_WORD(x)
#define SYMBOL(x)     Sg_Intern(Sg_MakeString(UC(x), SG_LITERAL_STRING))
#define SYMBOLW(x)    WORD(SYMBOL(x))
#define STRING(x)     Sg_MakeString(UC(x), SG_LITERAL_STRING)
#define STRINGW(x)    WORD(STRING(x))
#define KEYWORD(x)    Sg_MakeKeyword(STRING(x))
#define KEYWORDW(x)    WORD(KEYWORD(x))
#define IDENT(x, lib) WORD(Sg_MakeIdentifier(SYMBOL(x), SG_NIL, (lib)))
static struct sg__wcRec {
  SgCodeBuilder cb[3];
  SgWord        w[126];
} sg__wc = {
  { /* code builder */
    SG_STATIC_CODE_BUILDER(&sg__wc.w[66], NULL, 1, FALSE, 0, 9, 24), /* ensure-library-name */
    SG_STATIC_CODE_BUILDER(&sg__wc.w[90], NULL, 1, FALSE, 0, 12, 36), /* parse-args */
  },
  { /* compiled code */
  /*     0 */        0x0000002A           /* 0      (CLOSURE) */,
  /*     1 */        WORD(SG_UNDEF)  /* <code-builder> */,
  /*     2 */        0x00000037           /* 2      (DEFINE) */,
  /*     3 */        WORD(SG_UNDEF)  /* identifier#ensure-library-name */,
  /*     4 */        0x0000002A           /* 4      (CLOSURE) */,
  /*     5 */        WORD(SG_UNDEF)  /* <code-builder> */,
  /*     6 */        0x00000037           /* 6      (DEFINE) */,
  /*     7 */        WORD(SG_UNDEF)  /* identifier#parse-args */,
  /*     8 */        0x00000002           /* 8      (UNDEF) */,
  /*     9 */        0x00000003           /* 9      (CONST) */,
  /*    10 */        WORD(SG_UNDEF), /* (($UNDEF . 0) ($DEFINE . 1) ($LREF . 2) ($LSET . 3) ($GREF . 4) ($GSET . 5) ($CONST . 6) ($IF . 7) ($LET . 8) ($LAMBDA . 9) ($RECEIVE . 10) ($LABEL . 11) ($SEQ . 12) ($CALL . 13) ($ASM . 14) ($IT . 15) ($LIST . 16)) */
  /*    11 */        0x00000137           /* 11     (DEFINE) */,
  /*    12 */        WORD(SG_UNDEF)  /* identifier#|.intermediate-tags.| */,
  /*    13 */        0x00000004           /* 13     (CONSTI) */,
  /*    14 */        0x00000137           /* 14     (DEFINE) */,
  /*    15 */        WORD(SG_UNDEF)  /* identifier#$UNDEF */,
  /*    16 */        0x00000104           /* 16     (CONSTI) */,
  /*    17 */        0x00000137           /* 17     (DEFINE) */,
  /*    18 */        WORD(SG_UNDEF)  /* identifier#$DEFINE */,
  /*    19 */        0x00000204           /* 19     (CONSTI) */,
  /*    20 */        0x00000137           /* 20     (DEFINE) */,
  /*    21 */        WORD(SG_UNDEF)  /* identifier#$LREF */,
  /*    22 */        0x00000304           /* 22     (CONSTI) */,
  /*    23 */        0x00000137           /* 23     (DEFINE) */,
  /*    24 */        WORD(SG_UNDEF)  /* identifier#$LSET */,
  /*    25 */        0x00000404           /* 25     (CONSTI) */,
  /*    26 */        0x00000137           /* 26     (DEFINE) */,
  /*    27 */        WORD(SG_UNDEF)  /* identifier#$GREF */,
  /*    28 */        0x00000504           /* 28     (CONSTI) */,
  /*    29 */        0x00000137           /* 29     (DEFINE) */,
  /*    30 */        WORD(SG_UNDEF)  /* identifier#$GSET */,
  /*    31 */        0x00000604           /* 31     (CONSTI) */,
  /*    32 */        0x00000137           /* 32     (DEFINE) */,
  /*    33 */        WORD(SG_UNDEF)  /* identifier#$CONST */,
  /*    34 */        0x00000704           /* 34     (CONSTI) */,
  /*    35 */        0x00000137           /* 35     (DEFINE) */,
  /*    36 */        WORD(SG_UNDEF)  /* identifier#$IF */,
  /*    37 */        0x00000804           /* 37     (CONSTI) */,
  /*    38 */        0x00000137           /* 38     (DEFINE) */,
  /*    39 */        WORD(SG_UNDEF)  /* identifier#$LET */,
  /*    40 */        0x00000904           /* 40     (CONSTI) */,
  /*    41 */        0x00000137           /* 41     (DEFINE) */,
  /*    42 */        WORD(SG_UNDEF)  /* identifier#$LAMBDA */,
  /*    43 */        0x00000A04           /* 43     (CONSTI) */,
  /*    44 */        0x00000137           /* 44     (DEFINE) */,
  /*    45 */        WORD(SG_UNDEF)  /* identifier#$RECEIVE */,
  /*    46 */        0x00000B04           /* 46     (CONSTI) */,
  /*    47 */        0x00000137           /* 47     (DEFINE) */,
  /*    48 */        WORD(SG_UNDEF)  /* identifier#$LABEL */,
  /*    49 */        0x00000C04           /* 49     (CONSTI) */,
  /*    50 */        0x00000137           /* 50     (DEFINE) */,
  /*    51 */        WORD(SG_UNDEF)  /* identifier#$SEQ */,
  /*    52 */        0x00000D04           /* 52     (CONSTI) */,
  /*    53 */        0x00000137           /* 53     (DEFINE) */,
  /*    54 */        WORD(SG_UNDEF)  /* identifier#$CALL */,
  /*    55 */        0x00000E04           /* 55     (CONSTI) */,
  /*    56 */        0x00000137           /* 56     (DEFINE) */,
  /*    57 */        WORD(SG_UNDEF)  /* identifier#$ASM */,
  /*    58 */        0x00000F04           /* 58     (CONSTI) */,
  /*    59 */        0x00000137           /* 59     (DEFINE) */,
  /*    60 */        WORD(SG_UNDEF)  /* identifier#$IT */,
  /*    61 */        0x00001004           /* 61     (CONSTI) */,
  /*    62 */        0x00000137           /* 62     (DEFINE) */,
  /*    63 */        WORD(SG_UNDEF)  /* identifier#$LIST */,
  /*    64 */        0x00000002           /* 64     (UNDEF) */,
  /*    65 */        0x00000001           /* 65     (HALT) */,
  /*    66 */        0x0000004A           /* 0      (CONST_PUSH) */,
  /*    67 */        WORD(SG_UNDEF)  /* <keyrowd :null> */,
  /*    68 */        0x00000005           /* 2      (LREF) */,
  /*    69 */        0x00000021           /* 3      (BNEQV) */,
  /*    70 */        WORD(SG_MAKE_INT(5)),
  /*    71 */        0x00000003           /* 5      (CONST) */,
  /*    72 */        WORD(SG_UNDEF), /* null */
  /*    73 */        0x00000018           /* 7      (JUMP) */,
  /*    74 */        WORD(SG_MAKE_INT(15)),
  /*    75 */        0x0000004A           /* 9      (CONST_PUSH) */,
  /*    76 */        WORD(SG_UNDEF)  /* <keyrowd :sagittarius> */,
  /*    77 */        0x00000005           /* 11     (LREF) */,
  /*    78 */        0x00000021           /* 12     (BNEQV) */,
  /*    79 */        WORD(SG_MAKE_INT(5)),
  /*    80 */        0x00000003           /* 14     (CONST) */,
  /*    81 */        WORD(SG_UNDEF), /* (sagittarius) */
  /*    82 */        0x00000018           /* 16     (JUMP) */,
  /*    83 */        WORD(SG_MAKE_INT(6)),
  /*    84 */        0x0000004A           /* 18     (CONST_PUSH) */,
  /*    85 */        WORD(SG_UNDEF), /* "invalid library tag:" */
  /*    86 */        0x00000047           /* 20     (LREF_PUSH) */,
  /*    87 */        0x0000024D           /* 21     (GREF_TAIL_CALL) */,
  /*    88 */        WORD(SG_UNDEF)  /* identifier#error */,
  /*    89 */        0x00000030           /* 23     (RET) */,
  /*    90 */        0x00000332           /* 0      (LET_FRAME) */,
  /*    91 */        0x00000047           /* 1      (LREF_PUSH) */,
  /*    92 */        0x00000134           /* 2      (DISPLAY) */,
  /*    93 */        0x00000047           /* 3      (LREF_PUSH) */,
  /*    94 */        0x0000004B           /* 4      (CONSTI_PUSH) */,
  /*    95 */        0x00000233           /* 5      (POP_LET_FRAME) */,
  /*    96 */        0x0000001A           /* 6      (MARK) */,
  /*    97 */        0x00000005           /* 7      (LREF) */,
  /*    98 */        0x00000022           /* 8      (BNNULL) */,
  /*    99 */        WORD(SG_MAKE_INT(7)),
  /*   100 */        0x00000147           /* 10     (LREF_PUSH) */,
  /*   101 */        0x00000003           /* 11     (CONST) */,
  /*   102 */        WORD(SG_MAKE_BOOL(FALSE)),
  /*   103 */        0x0000023C           /* 13     (VALUES) */,
  /*   104 */        0x00000018           /* 14     (JUMP) */,
  /*   105 */        WORD(SG_MAKE_INT(20)),
  /*   106 */        0x00000005           /* 16     (LREF) */,
  /*   107 */        0x00000040           /* 17     (PAIRP) */,
  /*   108 */        0x00000017           /* 18     (TEST) */,
  /*   109 */        WORD(SG_MAKE_INT(12)),
  /*   110 */        0x00000005           /* 20     (LREF) */,
  /*   111 */        0x00000039           /* 21     (CDR) */,
  /*   112 */        0x0000000B           /* 22     (PUSH) */,
  /*   113 */        0x00000105           /* 23     (LREF) */,
  /*   114 */        0x0000010F           /* 24     (ADDI) */,
  /*   115 */        0x0000000B           /* 25     (PUSH) */,
  /*   116 */        0x00000219           /* 26     (SHIFTJ) */,
  /*   117 */        0x00000018           /* 27     (JUMP) */,
  /*   118 */        WORD(SG_MAKE_INT(-21)),
  /*   119 */        0x00000018           /* 29     (JUMP) */,
  /*   120 */        WORD(SG_MAKE_INT(5)),
  /*   121 */        0x00000147           /* 31     (LREF_PUSH) */,
  /*   122 */        0x00000003           /* 32     (CONST) */,
  /*   123 */        WORD(SG_MAKE_BOOL(TRUE)),
  /*   124 */        0x0000023C           /* 34     (VALUES) */,
  /*   125 */        0x00000030           /* 35     (RET) */,
  }
};

static SgCodeBuilder toplevel_sagittarius_compiler_util = SG_STATIC_CODE_BUILDER(&sg__wc.w[0], SG_FALSE, 0, FALSE, 0, 0, 66);
void Sg__Init_sagittarius_compiler_util()
{
  SgLibrary *lib = Sg_FindLibrary(SYMBOL("(sagittarius compiler util)"), TRUE);
  SgLibrary *save = Sg_VM()->currentLibrary;
  sg__wc.w[39] = IDENT("$LET", lib);
  sg__wc.w[85] = STRINGW("invalid library tag:");
  sg__wc.w[1] = WORD(&sg__wc.cb[0]);
sg__wc.cb[0].name = SYMBOL("ensure-library-name");
  sg__wc.w[81] = WORD(Sg_Cons(SYMBOL("sagittarius"), SG_NIL));
  sg__wc.w[15] = IDENT("$UNDEF", lib);
  sg__wc.w[72] = SYMBOLW("null");
  sg__wc.w[63] = IDENT("$LIST", lib);
  sg__wc.w[57] = IDENT("$ASM", lib);
  sg__wc.w[48] = IDENT("$LABEL", lib);
  sg__wc.w[27] = IDENT("$GREF", lib);
  sg__wc.w[5] = WORD(&sg__wc.cb[1]);
sg__wc.cb[1].name = SYMBOL("parse-args");
  sg__wc.w[21] = IDENT("$LREF", lib);
  sg__wc.w[7] = IDENT("parse-args", lib);
  sg__wc.w[42] = IDENT("$LAMBDA", lib);
  sg__wc.w[33] = IDENT("$CONST", lib);
  sg__wc.w[36] = IDENT("$IF", lib);
  sg__wc.w[54] = IDENT("$CALL", lib);
  sg__wc.w[12] = IDENT(".intermediate-tags.", lib);
  sg__wc.w[3] = IDENT("ensure-library-name", lib);
  sg__wc.w[24] = IDENT("$LSET", lib);
  sg__wc.w[18] = IDENT("$DEFINE", lib);
  sg__wc.w[76] = KEYWORDW("sagittarius");
  sg__wc.w[60] = IDENT("$IT", lib);
  sg__wc.w[30] = IDENT("$GSET", lib);
  sg__wc.w[45] = IDENT("$RECEIVE", lib);
  sg__wc.w[10] = WORD(Sg_Cons(Sg_Cons(SYMBOL("$UNDEF"), SG_MAKE_INT(0)), Sg_Cons(Sg_Cons(SYMBOL("$DEFINE"), SG_MAKE_INT(1)), Sg_Cons(Sg_Cons(SYMBOL("$LREF"), SG_MAKE_INT(2)), Sg_Cons(Sg_Cons(SYMBOL("$LSET"), SG_MAKE_INT(3)), Sg_Cons(Sg_Cons(SYMBOL("$GREF"), SG_MAKE_INT(4)), Sg_Cons(Sg_Cons(SYMBOL("$GSET"), SG_MAKE_INT(5)), Sg_Cons(Sg_Cons(SYMBOL("$CONST"), SG_MAKE_INT(6)), Sg_Cons(Sg_Cons(SYMBOL("$IF"), SG_MAKE_INT(7)), Sg_Cons(Sg_Cons(SYMBOL("$LET"), SG_MAKE_INT(8)), Sg_Cons(Sg_Cons(SYMBOL("$LAMBDA"), SG_MAKE_INT(9)), Sg_Cons(Sg_Cons(SYMBOL("$RECEIVE"), SG_MAKE_INT(10)), Sg_Cons(Sg_Cons(SYMBOL("$LABEL"), SG_MAKE_INT(11)), Sg_Cons(Sg_Cons(SYMBOL("$SEQ"), SG_MAKE_INT(12)), Sg_Cons(Sg_Cons(SYMBOL("$CALL"), SG_MAKE_INT(13)), Sg_Cons(Sg_Cons(SYMBOL("$ASM"), SG_MAKE_INT(14)), Sg_Cons(Sg_Cons(SYMBOL("$IT"), SG_MAKE_INT(15)), Sg_Cons(Sg_Cons(SYMBOL("$LIST"), SG_MAKE_INT(16)), SG_NIL))))))))))))))))));
  sg__wc.w[51] = IDENT("$SEQ", lib);
  sg__wc.w[67] = KEYWORDW("null");
  sg__wc.w[88] = IDENT("error", lib);
  Sg_ImportLibrary(lib, SG_OBJ(SYMBOL("(sagittarius)")));
  Sg_ImportLibrary(lib, SG_OBJ(SYMBOL("(core base)")));
  Sg_ImportLibrary(lib, SG_OBJ(SYMBOL("null")));
  Sg_LibraryExportedSet(lib, Sg_Cons(Sg_Cons(SYMBOL("$UNDEF"), Sg_Cons(SYMBOL("$DEFINE"), Sg_Cons(SYMBOL("$LREF"), Sg_Cons(SYMBOL("$LSET"), Sg_Cons(SYMBOL("$GREF"), Sg_Cons(SYMBOL("$GSET"), Sg_Cons(SYMBOL("$CONST"), Sg_Cons(SYMBOL("$IF"), Sg_Cons(SYMBOL("$LET"), Sg_Cons(SYMBOL("$LAMBDA"), Sg_Cons(SYMBOL("$RECEIVE"), Sg_Cons(SYMBOL("$LABEL"), Sg_Cons(SYMBOL("$SEQ"), Sg_Cons(SYMBOL("$CALL"), Sg_Cons(SYMBOL("$ASM"), Sg_Cons(SYMBOL("$IT"), Sg_Cons(SYMBOL("$LIST"), Sg_Cons(SYMBOL(".intermediate-tags."), Sg_Cons(SYMBOL("define-simple-struct"), Sg_Cons(SYMBOL("define-enum"), Sg_Cons(SYMBOL("case/unquote"), Sg_Cons(SYMBOL("parse-args"), Sg_Cons(SYMBOL("ensure-library-name"), SG_NIL))))))))))))))))))))))), SG_NIL));
  Sg_VM()->currentLibrary = lib;
  Sg_VMExecute(SG_OBJ(&toplevel_sagittarius_compiler_util));
  Sg_VM()->currentLibrary = save;
}
