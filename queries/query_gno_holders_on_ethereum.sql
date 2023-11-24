WITH
balance as (
    SELECT address ,sum(amount)/1e18 as amount
    FROM (
        SELECT -- tokens sold
            "from" as address, 
            -SUM(value) as amount
        FROM erc20_ethereum.evt_Transfer
        WHERE contract_address = from_hex('{{tokenContract}}')
        GROUP BY 1
        
        UNION ALL
    
        SELECT -- tokens bought
            "to" as address, 
            SUM(value) as amount
        FROM erc20_ethereum.evt_Transfer
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

-- GNO address = 0x6810e776880c02933d47db1b9fc05908e5386b96