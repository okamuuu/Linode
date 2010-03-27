<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf8" />
    <title><%= $archive->title %> | <%= $site_name %></title>
    <meta name="keywords" content="<%= join ', ', @{ $archive->keywords } %>" />
    <meta name="description" content="<%= $archive->description %>" />
	<meta name="author" content="http://github.com/okamuuu" />
	<meta name="copyright" content="Copyright (C) okamura" />
    <meta name="robots" content="all" />

% if ( $is_home ) {
    <link rel="stylesheet" type="text/css" media="screen" href="common/css/import.css"/>
% } else {
    <link rel="stylesheet" type="text/css" media="screen" href="../common/css/import.css"/>
% }
</head>
<body>
	<div id="wrapper">
		<div id="wrap">
			<div id="header">
				<p id="title"><a href="/"><%= $site_name %></a></p>
			</div>
<%= raw_string($tab->xhtml) %>
<%= raw_string($bread->xhtml) %>
			<div id="side-bar">
% for my $menu ( @{ $menus } ) {
<%= raw_string($menu->xhtml) %>
% }
			</div>
		    <div id="content">
		        <% block content => sub {} %>
		    </div>
			<br class="clear" />
			<div id="footer">
				<p>
					<a href="http://linode.jp">Linode</a> | 
					<a href="http://www.add9.biz/phpunit">PHPUnit</a> | 
					<a href="http://www.add9.biz/symfony">Symfony</a>
					<br />
				
					<a href="http://www.add9.biz/c">C</a> | 
					<a href="http://www.add9.biz/moose">Moose</a> | 
					<a href="http://www.add9.biz/design_pattern">Design Pattern</a>
					<br />

					<a href="http://www.add9.biz/jump">Jump Attack Forum</a> | 
					<a href="http://dancepod.tv">DancePod.tv</a> 
				</p>
			</div>
	    </div>
		<div id="adsence">
			<script type="text/javascript"><!--
			google_ad_client = "pub-3627018862025650";
			google_ad_slot = "0294735282";
			google_ad_width = 160;
			google_ad_height = 600;
			//-->
			</script>
			<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
		</div>
	</div>
	<script type="text/javascript">
	var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script type="text/javascript">
	try {
	var pageTracker = _gat._getTracker("UA-7965172-1");
	pageTracker._trackPageview();
	} catch(err) {}</script>
</body>
</html>
