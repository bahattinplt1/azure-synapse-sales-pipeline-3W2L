-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://datalakebehsf3u.dfs.core.windows.net/files/dbcdc309-c683-47a3-82f5-16af51c3c9dc/part-00000-c8f8df0a-153a-47c1-bf4a-a434621ef98f-c000.snappy.parquet',
        FORMAT = 'PARQUET'
    ) AS [result]
