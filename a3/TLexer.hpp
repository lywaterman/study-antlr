/** \file
 *  This C++ header file was generated by $ANTLR version 3.5.2
 *
 *     -  From the grammar source file : T.g
 *     -                            On : 2015-11-09 12:31:31
 *     -                 for the lexer : TLexerLexer
 *
 * Editing it, at least manually, is not wise.
 *
 * C++ language generator and runtime by Gokulakannan Somasundaram ( heavy lifting from C Run-time by Jim Idle )
 *
 *
 * The lexer TLexer has the callable functions (rules) shown below,
 * which will invoke the code for the associated rule in the source grammar
 * assuming that the input stream is pointing to a token/text stream that could begin
 * this rule.
 *
 * For instance if you call the first (topmost) rule in a parser grammar, you will
 * get the results of a full parse, but calling a rule half way through the grammar will
 * allow you to pass part of a full token stream to the parser, such as for syntax checking
 * in editors and so on.
 *
 */
// [The "BSD license"]
// Copyright (c) 2005-2009 Gokulakannan Somasundaram. 
//
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
// 3. The name of the author may not be used to endorse or promote products
//    derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
// IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
// IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
// NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
// THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#ifndef	_TLexer_H
#define _TLexer_H
/* =============================================================================
 * Standard antlr3 C++ runtime definitions
 */
#include <antlr3.hpp>

/* End of standard antlr 3 runtime definitions
 * =============================================================================
 */




#ifdef	WIN32
// Disable: Unreferenced parameter,							- Rules with parameters that are not used
//          constant conditional,							- ANTLR realizes that a prediction is always true (synpred usually)
//          initialized but unused variable					- tree rewrite variables declared but not needed
//          Unreferenced local variable						- lexer rule declares but does not always use _type
//          potentially unitialized variable used			- retval always returned from a rule
//			unreferenced local function has been removed	- susually getTokenNames or freeScope, they can go without warnigns
//
// These are only really displayed at warning level /W4 but that is the code ideal I am aiming at
// and the codegen must generate some of these warnings by necessity, apart from 4100, which is
// usually generated when a parser rule is given a parameter that it does not use. Mostly though
// this is a matter of orthogonality hence I disable that one.
//
#pragma warning( disable : 4100 )
#pragma warning( disable : 4101 )
#pragma warning( disable : 4127 )
#pragma warning( disable : 4189 )
#pragma warning( disable : 4505 )
#pragma warning( disable : 4701 )
#endif

typedef TLexerTraits TLexerImplTraits;


class TLexerTokens
{
public:
	/** Symbolic definitions of all the tokens that the lexer will work with.
	 *
	 * Antlr will define EOF, but we can't use that as it it is too common in
	 * in C header files and that would be confusing. There is no way to filter this out at the moment
	 * so we just undef it here for now. That isn't the value we get back from C recognizers
	 * anyway. We are looking for ANTLR_TOKEN_EOF.
	 */
	enum Tokens 
	{
		EOF_TOKEN = TLexerImplTraits::CommonTokenType::TOKEN_EOF
		, T__40 = 40 
		, T__41 = 41 
		, T__42 = 42 
		, T__43 = 43 
		, T__44 = 44 
		, T__45 = 45 
		, AndAnd = 4 
		, Assign = 5 
		, COMMENT = 6 
		, Choice = 7 
		, ChoiceLeft = 8 
		, Delay = 9 
		, Digit = 10 
		, Dollar = 11 
		, DoubleCloseSquareBracket = 12 
		, DoubleOpenSquareBracket = 13 
		, ElseIf = 14 
		, EndIf = 15 
		, EndSilently = 16 
		, Equal = 17 
		, False = 18 
		, FuncDec = 19 
		, Gte = 20 
		, INT = 21 
		, If = 22 
		, Label = 23 
		, Minus = 24 
		, MinusAssign = 25 
		, Or = 26 
		, OrOr = 27 
		, PlusAssign = 28 
		, Set = 29 
		, ShiftLeft = 30 
		, ShiftRight = 31 
		, Silently = 32 
		, String = 33 
		, TEXT = 34 
		, ThenFunc = 35 
		, Time = 36 
		, True = 37 
		, VarName = 38 
		, WS = 39 
	};

};

/** Context tracking structure for TLexer
 */
class TLexer : public TLexerImplTraits::BaseLexerType, public TLexerTokens
{
public:
	typedef TLexerImplTraits ImplTraits;
	typedef TLexer ComponentType;
	typedef ComponentType::StreamType StreamType;
	typedef TLexerImplTraits::BaseLexerType BaseType;
	typedef ImplTraits::RecognizerSharedStateType<StreamType> RecognizerSharedStateType;
	typedef StreamType InputType;
	static const bool IsFiltered = false;


private:	
public:
    TLexer(InputType* instream);
    TLexer(InputType* instream, RecognizerSharedStateType* state);

    void init(InputType* instream  );


    
    void  mT__40( );
    void  mT__41( );
    void  mT__42( );
    void  mT__43( );
    void  mT__44( );
    void  mT__45( );
    void  mFuncDec( );
    void  mEqual( );
    void  mMinus( );
    void  mDollar( );
    void  mAssign( );
    void  mPlusAssign( );
    void  mMinusAssign( );
    void  mDoubleOpenSquareBracket( );
    void  mDoubleCloseSquareBracket( );
    void  mShiftLeft( );
    void  mShiftRight( );
    void  mVarName( );
    void  mThenFunc( );
    void  mOr( );
    void  mGte( );
    void  mSet( );
    void  mSilently( );
    void  mEndSilently( );
    void  mChoice( );
    void  mChoiceLeft( );
    void  mIf( );
    void  mElseIf( );
    void  mEndIf( );
    void  mDelay( );
    void  mAndAnd( );
    void  mOrOr( );
    void  mDigit( );
    void  mTime( );
    void  mINT( );
    void  mTrue( );
    void  mFalse( );
    void  mCOMMENT( );
    void  mString( );
    void  mLabel( );
    void  mTEXT( );
    void  mWS( );
    void  mTokens( );
    const char *    getGrammarFileName();
    void            reset();
    ~TLexer();

};

// Function protoypes for the constructor functions that external translation units
// such as delegators and delegates may wish to call.
//

/* End of token definitions for TLexer
 * =============================================================================
 */


#endif

/* END - Note:Keep extra line feed to satisfy UNIX systems */
