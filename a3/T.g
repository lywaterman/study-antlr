grammar T ;

options {
    language=Cpp;
}

@parser::includes
{
   #include "TLexer.hpp"
}

@lexer::namespace { User }
@parser::namespace{ User }

@lexer::traits 
{
    class TLexer; 
    class TParser; 

    template<class ImplTraits>
    class UserTraits : public antlr3::CustomTraitsBase<ImplTraits>
    {
    public:
        //for using the token stream which deleted the tokens, once it is reduced to a rule
        //but it leaves the start and stop tokens. So they can be accessed as usual
        static const bool TOKENS_ACCESSED_FROM_OWNING_RULE = true;
    };

    typedef antlr3::Traits< TLexer, TParser, UserTraits > TLexerTraits;
    typedef TLexerTraits TParserTraits;

    /* If you don't want the override it is like this.
       class TLexer;
       class TParser;
       typedef antlr3::Traits< TLexer, TParser > TLexerTraits;
       typedef TLexerTraits TParserTraits;
     */
}


//语法分析
///////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

//赋值操作符
assignmentOperator : Assign | '+=' | '-=' ;

operatorComparison : 'is' | 'gte' ;
operatorAddSub : '+' | '-' ;
operatorAndAnd: AndAnd;
operatorOrOr : OrOr;

operators: operatorComparison | operatorAddSub | operatorAndAnd | operatorOrOr ;

operatorOr : Or;

number : Int;

time : Time ;

boolvalue: True | False ;

var : VarName ;

str : String;

exp : number | str | time | boolvalue | var;

exp_op : exp operatorComparison exp | exp operatorAddSub exp | exp operatorAndAnd exp | exp operatorOrOr exp;

exp_or_op : exp (operators exp)* ;

st : set_st | if_st | silently_st | choice_st | select_st | string_st | callFunction ;

//字符串表达式，用来显示字符串
string_st : TEXT;

button_str : TEXT;

// <<set $toldname = 0>> set表达式用来给变量赋值
set_st : '<<set' var assignmentOperator exp_or_op '>>' ;

if_st : '<<if' exp_or_op '>>' st* ('<<elseif' exp_or_op '>>' st*)* ('<<else>>' st*)? '<<endif>>' ;

//choice_st
choice_st : ChoiceLeft callFunction '>>' ;

//select_st
select_st : choice_st operatorOr choice_st ;

// <<silently>>  <<endsilently>> 在中间的代码都不会影响显示, 目前只用来赋值
silently_st : Silently set_st* EndSilently ;

// function主要用来显示和跳转
function : FuncDec Label st* ;

function_list : function+ ;

then_st : ThenFunc | ThenFunc exp_or_op ;

delay_st : Delay Time ;

fun_name : Label ;
//调用函数
callFunction : '[[' fun_name ']]' | '[[' delay_st then_st ']]' | '[[' button_str then_st']]' ;

 
//[通话接入], [[launch]], 前一个我们可以认为是调用了一个匿名函数， 函数体是当中的字符串，后一个我们可以任务是调用了,名为launch的函数


//词法分析
FuncDec : '::' ;

Equal : 'is' ;

Minus : '-' ;

Dollar : '$';

Assign : '=' ;
PlusAssign : '+=';
MinusAssign : '-=';

DoubleOpenSquareBracket: '[[';
DoubleCloseSquareBracket: ']]';

ShiftLeft:          '<<';

ShiftRight:         '>>';


VarName: '$' Label ;

ThenFunc: Or Label ;   //在函数体里面如果接受到click时间，那么执行已Label为名字的函数

Or : '|' ;

Gte : 'gte' ;

Set : 'set' ;


Silently : '<<silently>>' ;
EndSilently: '<<endsilently>>' ;

Choice : 'choice' ;

ChoiceLeft : ShiftLeft Choice ;

If : 'if' ;

ElseIf : 'elseif' ;

EndIf : 'endif' ;

Delay : 'delay' ;

AndAnd : 'and' ;

OrOr : 'or' ;

//数字
Time : Int's' | Int'm' ;

Int : '0'..'9'+ ;

True : 'true' ;

False : 'false' ;

String: '"' ~('"')* '"' ; 

Label: ('a'..'z' | 'A' .. 'Z' | '_')  ('a'..'z' | 'A' .. 'Z' | '0'..'9' | '_')*; //首字母不能是数字

TEXT: '#' ~('#')+ '#' ; 

COMMENT
    : '/*' ( options {greedy=false;} : . )* '*/' {$channel=HIDDEN;} ;

LINE_COMMENT
    : '//' ~('\n'|'\r')* '\r'? '\n' {$channel=HIDDEN;} ;

WS  : (' '|'\r'|'\t'|'\u000C'|'\n') {$channel=HIDDEN;} ;

