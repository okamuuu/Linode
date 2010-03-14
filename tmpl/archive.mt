% extends 'base.mt'

% block content => sub { 
<%= raw_string($archive->content) %>
% }

