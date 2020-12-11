<?php
    $lines = explode("\n", file_get_contents('input'));
    $ids = array();
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
        array_push($ids, $id);
    }

    sort($ids);

    for ($i = 1; $i < count($ids)-1; $i++) {
        $a = $ids[$i-1];
        $b = $ids[$i];
        $c = $ids[$i+1];

        if ($b != $a+1 and $b == $c-1)
            echo ($a+1)."\n";
    }
?>
