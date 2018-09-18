#!/usr/bin/php
<?php

function getTime(string $path): int
{
    $time = exec('ffmpeg -i '. escapeshellarg($path) . " 2>&1 | grep 'Duration' | cut -d ' ' -f 4 | sed s/,//");
    [$hms, $milli] = explode('.', $time);
    [$hours, $minutes, $seconds] = explode(':', $hms);

    if (is_numeric($hours) === false || is_numeric($minutes) === false || is_numeric($seconds) === false) {
        var_dump($hours);
        var_dump($minutes);
        var_dump($seconds);
        var_dump($path);
    }

    // Time in Seconds
    return (($hours ?? 0) * 3600) + (($minutes ?? 0) * 60) + ($seconds ?? 0);
}

$dir = new DirectoryIterator($argv[1]);

foreach ($dir as $fileinfo) {
    if (!$fileinfo->isDot() && ($fileinfo->getExtension() === 'm4b' || $fileinfo->getExtension() === 'mp3')) {
        $path = $fileinfo->getRealPath();
        echo "\n";
        echo 'File: '.$fileinfo->getBasename()."\n";
        echo 'Size: '.filesize($path)."\n";
        echo 'Time: '.getTime($path)."\n";
        echo "\n";
    }
}
