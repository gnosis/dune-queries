WITH
balance as (
    SELECT address ,sum(amount)/1e18 as amount
    FROM (
        SELECT -- tokens sold
            "from" as address, 
            -SUM(value) as amount
        FROM erc20_gnosis.evt_Transfer
        WHERE contract_address = from_hex('{{tokenContract}}')
        GROUP BY 1
        
        UNION ALL
    
        SELECT -- tokens bought
            "to" as address, 
            SUM(value) as amount
        FROM erc20_gnosis.evt_Transfer
        WHERE contract_address = from_hex('{{tokenContract}}')
        GROUP BY 1
        ) temp
    GROUP BY 1
    ORDER BY 2 DESC
)

SELECT 
    address
    ,amount
FROM balance WHERE amount > 0

-- GNO address = 0x9C58BAcC331c9aa871AFD802DB6379a98e80CEdb
