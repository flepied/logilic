%% -*- prolog -*-
%%---------------------------------------------------------------
%% Project         : logilic
%% File            : licenses.pl
%% Copyright       : (C) 2012 Frederic Lepied
%% Author          : Frederic Lepied
%% Created On      : Mon Nov 19 20:46:58 2012
%% Purpose         : facts to reason on licenses
%%---------------------------------------------------------------
%% This program is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation; either version 2 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License along
%% with this program; if not, write to the Free Software Foundation, Inc.,
%% 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
%%---------------------------------------------------------------

%% license facts

requirement(gpl_license, provide_sourcecode).
requirement(lgpl_license, provide_sourcecode).
requirement(mpl_license, provide_sourcecode).
requirement(openssl_license, mention_in_doc).

contaminate(gpl_license).

staticlink_contaminate(lgpl_license).

%% component facts

license(openssl, openssl_license, _).
license(qt, lgpl_license, _).
license(curl, mit_license, _).
license(png, png_license, _).
license(zlib, zlib_license, _).
license(xbmc, gpl_license, _).
license(prog1, proprietary_license, _).
license(cpputest, bsd_license, _).
license(bison, gpl_license, _).

%% licenses.pl ends here
