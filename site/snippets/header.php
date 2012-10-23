<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <link rel="apple-touch-icon" href="resources/images/icon@2x.png">
    <link rel="apple-touch-startup-image" href="resources/images/splash.png">
    <title><?php echo html($site->title()) ?> - <?php echo html($page->title()) ?></title>
    <meta name="description" content="<?php echo html($site->description()) ?>">
    <meta name="keywords" content="<?php echo html($site->keywords()) ?>">
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,700|Comfortaa:400,700' rel='stylesheet' type='text/css'>
    <?php
    echo css('css/style.min.css');
    ?>
</head>
