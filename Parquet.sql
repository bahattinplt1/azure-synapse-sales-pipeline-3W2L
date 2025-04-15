-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://datalakebehsf3u.dfs.core.windows.net/files/97cf0668-9555-49c6-ba61-bbe78a8bbd69/part-00000-893c55b0-ba31-4545-837c-696214452818-c000.snappy.parquet',
        FORMAT = 'PARQUET'
    ) AS [result]
