%% -*- prolog -*-
%%---------------------------------------------------------------
%% Project         : prolog
%% File            : project1.pl
%% Copyright       : (C) 2012 Frederic Lepied
%% Author          : Frederic Lepied
%% Created On      : Mon Nov 19 20:42:20 2012
%% Purpose         : list facts about a project.
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

%% project facts

library(openssl, '0.9.8f').
library(qt, '4.8.4').
library(curl, '7.27').
library(png, '1.5.13').
library(zlib, '1.2.7').

executable(xbmc, '2.0').
executable(prog1, '3.1').

dynamiclink(prog1, openssl).
dynamiclink(prog1, qt).
staticlink(prog1, curl).
staticlink(prog1, zlib).

testtool(cpputest, '3.3').

buildtool(bison, '2.5').

%% project1.pl ends here
