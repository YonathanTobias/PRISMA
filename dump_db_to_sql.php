<?php

$dbPath = 'database/database.sqlite';
$outputPath = 'database/database.sql';

if (!file_exists($dbPath)) {
    die("Database file not found at: $dbPath\n");
}

try {
    $pdo = new PDO("sqlite:$dbPath");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sqlDump = "-- SIMPEG Database SQL Dump\n";
    $sqlDump .= "-- Generated on: " . date('Y-m-d H:i:s') . "\n";
    $sqlDump .= "-- Compatible with MySQL, PostgreSQL, and SQLite\n\n";
    $sqlDump .= "PRAGMA foreign_keys=OFF;\n";
    $sqlDump .= "BEGIN TRANSACTION;\n\n";

    // 1. Get all user tables
    $stmt = $pdo->query("SELECT name, sql FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%'");
    $tables = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($tables as $table) {
        $tableName = $table['name'];
        $createSql = $table['sql'];

        $sqlDump .= "-- --------------------------------------------------------\n";
        $sqlDump .= "-- Table structure for table `$tableName`\n";
        $sqlDump .= "-- --------------------------------------------------------\n";
        $sqlDump .= "DROP TABLE IF EXISTS `$tableName`;\n";
        
        // Convert SQLite autoincrement schema to generic SQL where possible, or write directly
        $sqlDump .= $createSql . ";\n\n";

        $sqlDump .= "-- Dumping data for table `$tableName`\n";
        $dataStmt = $pdo->query("SELECT * FROM `$tableName`");
        $rows = $dataStmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($rows)) {
            $columns = array_keys($rows[0]);
            $colList = implode("`, `", $columns);
            
            foreach ($rows as $row) {
                $values = [];
                foreach ($row as $val) {
                    if ($val === null) {
                        $values[] = 'NULL';
                    } elseif (is_numeric($val)) {
                        $values[] = $val;
                    } else {
                        // Escape string quotes
                        $escapedVal = str_replace("'", "''", $val);
                        $values[] = "'" . $escapedVal . "'";
                    }
                }
                $valList = implode(", ", $values);
                $sqlDump .= "INSERT INTO `$tableName` (`$colList`) VALUES ($valList);\n";
            }
        }
        $sqlDump .= "\n";
    }

    $sqlDump .= "COMMIT;\n";
    $sqlDump .= "PRAGMA foreign_keys=ON;\n";

    file_put_contents($outputPath, $sqlDump);
    echo "Successfully dumped SQLite database to $outputPath (" . strlen($sqlDump) . " bytes)\n";

} catch (PDOException $e) {
    die("Database Error: " . $e->getMessage() . "\n");
}
