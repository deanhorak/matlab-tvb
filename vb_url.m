function url = vb_url(address)
%
% Returns the server url for the default address opened by the 
% TVB distribution. 
%
% 

parts = strsplit(address, '/');
url = ['http://' parts{2} '/']