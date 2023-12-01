<?php
    $lines = explode("\n", file_get_contents('input'));
    $max_id = 0;

    foreach ($lines as $line) {
        if ($line == '')
            continue;

        $rows_lower = 0;
        $rows = 128;
        $cols_lower = 0;
        $cols = 8;

        foreach (str_split($line) as $char) {
            switch ($char) {
                case 'F':
                    $rows /= 2;
                    break;
                case 'B':
                    $rows /= 2;
                    $rows_lower += $rows;
                    break;
                case 'L':
                    $cols /= 2;
                    break;
                case 'R':
                    $cols /= 2;
                    $cols_lower += $cols;
                    break;
            }
        }

        $id = $rows_lower*8 + $cols_lower;
        if ($id > $max_id)
            $max_id = $id;

        echo $line."\t".$rows_lower.' '.$cols_lower."\tID: ".$id."\n";
    }

    echo "Max ID: ".$max_id."\n";
?>
