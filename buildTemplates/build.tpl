<!DOCTYPE html>
<html lang="en-us" id="vvt" style="background: black">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta charset="UTF-8">
	<meta name="description" content="Vincent V. Toscano website.">
	<meta name="keywords" content="Vincent V. Toscano">
	<meta name="author" content="Vincent V. Toscano">
	<meta name="copyright" content="&copy;2015 Vincent V. Toscano">
	<title>CI_BUILD_NUMBER</title>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
	<style>
		html, body, div, span, applet, object, iframe,
		h1, h2, h3, h4, h5, h6, p, blockquote, pre,
		a, abbr, acronym, address, big, cite, code,
		del, dfn, em, img, ins, kbd, q, s, samp,
		small, strike, strong, sub, sup, tt, var,
		b, u, i, center,
		dl, dt, dd, ol, ul, li,
		fieldset, form, label, legend,
		table, caption, tbody, tfoot, thead, tr, th, td,
		article, aside, canvas, details, embed,
		figure, figcaption, footer, header, hgroup,
		menu, nav, output, ruby, section, summary,
		time, mark, audio, video {
			margin: 0;
			padding: 0;
			border: 0;
			outline: 0;

			color: inherit;
			font-size: 100%;
			font-weight: normal;
			font: inherit;
			vertical-align: baseline;

			background: transparent;

			pointer-events: inherit;
			opacity: inherit;
		}

		html, body {
			font: normal normal normal 10pt/normal Arial, Helvetica, sans-serif;
			color: #9e9e9e;
		}

		p, span, div, * {
			cursor: default;
			-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
		}

		a img, textarea {
			border: 0 none;
			outline: none;
			border-width: 0;
			background-color: transparent;
		}

		a {
			text-decoration: none;
			cursor: pointer;
			white-space: nowrap;
			-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
		}

		a:link {
			-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
		}

		a:visited {
		}

		a:hover {
			cursor: pointer;
			text-decoration: none;
		}

		a:active {
		}

		h1, h2, h3, h4, h5, h6 {
			font-weight: bold;
		}

		input[type="button"] {
			width: 100px;
			font-weight: bold;
		}
		ol, ul {
			list-style: none;
		}

		table {
			border-collapse: collapse;
			border-spacing: 0;
		}

		caption, th, td {
			text-align: left;
			font-weight: normal;
			vertical-align: middle;
		}

		q, blockquote {
			quotes: none;
		}

		q:before, q:after, blockquote:before, blockquote:after {
			content: "";
			content: none;
		}

		article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary {
			display: block;
		}
		*, *:before, *:after {
			-moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box;
		}

		.fontIssued{
			position: absolute;
			color: white;
			font-family: 'Open Sans', Helvetica, Arial, sans-serif;
			font-size: 100%;
		}
		html, body {
			height: 100%;
			width: 100%;
			overflow-x: hidden;
		}
		body{
			margin: 1% 1% 0 1%;
		}
		h1{
			font-size: 150%;
			color: black;
			background: white;
			margin:10px 0 5px 0;
		}
		h2{
			font-size: 125%;
			color: black;
			background: lightcoral;
		}
		h1, h2, h3, h4, h5, h6,pre {
			width: 98%;
		}
	</style>
</head>
<body class="fontIssued">
	<h1>Commit</h1>

	<h2>Commit Hash:</h2>
	<pre>CI_COMMIT_ID</pre>


	<h2>Branch:</h2>
	<pre>CI_BRANCH</pre>


	<h2>Commit Message:</h2>
	<pre>CI_MESSAGE</pre>

	<h2>Committer:</h2>
	<pre>CI_COMMITTER_NAME</pre>