{% docs payment_status %}

CASE
               WHEN DifyType.TypeDescription = 'Pre sale'
                    AND fc.DoItForYouOptInDateKey <> -1
                    AND Difystatus.StatusGroupName = 'Signed' THEN
                   1
               ELSE
                   0
           END AS DifyPreSaleSent
LEFT OUTER JOIN DimType DifyType
            ON DifyType.TypeKey = fc.DoItForYouTypeKey
 LEFT OUTER JOIN dbo.DimDate DIFYSigned
            ON fc.DoItForYouSignedDateKey = DIFYSigned.DateKey

{% enddocs %}