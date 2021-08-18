// -------------------------------------------------------------------------
// SWT - Scilab wavelet toolbox
// Copyright (C) 2010-2014  Holger Nahrstaedt
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//-------------------------------------------------------------------------
//
//  <-- NO CHECK ERROR OUTPUT -->


// Utility Function Test
// qmf test

a=rand(1,5,'uniform');
b=qmf(a);
b1=qmf(a,0);
b2=qmf(a,1);
b3=qmf(a');
b4=qmf(a',0);
b5=qmf(a',1);
c=[0 0 0 0 1;0 0 0 -1 0;0 0 1 0 0;0 -1 0 0 0;1 0 0 0 0];
c1=[0 0 0 0 -1;0 0 0 1 0;0 0 -1 0 0;0 1 0 0 0;-1 0 0 0 0];
d=a*c;
d1=a*c1;


assert_checkalmostequal ( b , b1 , %eps );
assert_checkalmostequal ( b , d , %eps );
assert_checkalmostequal ( b2 , d1 , %eps );
assert_checkalmostequal ( b3 , b' , %eps );
assert_checkalmostequal ( b4 , b' , %eps );
assert_checkalmostequal ( b5 , d1' , %eps );
