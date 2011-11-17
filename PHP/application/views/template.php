<!doctype html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title><?=$title?></title>
	<meta name="description" content="SIP-Agent">
	<meta name="author" content="Ando Roots">

	<meta name="viewport" content="width=device-width,initial-scale=1">


</head>
<body>

<div class="container">
	<h1><?=$title?></h1>
	<?=Notify::render()?>
	<?=$content?>
</div>
</body>
</html>
