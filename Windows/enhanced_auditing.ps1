auditpol /set /Subcategory:"Credential Validation" /success:enable /failure:enable
auditpol /set /Subcategory:"Other Account Logon Events" /success:enable /failure:enable
auditpol /set /Subcategory:"Security Group Management" /success:enable /failure:enable
auditpol /set /Subcategory:"User Account Management" /success:enable /failure:enable
auditpol /set /Subcategory:"DPAPI Activity" /success:enable /failure:enable
auditpol /set /Subcategory:"PNP Activity" /success:enable /failure:enable
auditpol /set /Subcategory:"Process Creation" /success:enable /failure:enable
auditpol /set /Subcategory:"Process Termination" /success:enable /failure:enable
auditpol /set /Subcategory:"Account Lockout" /success:enable /failure:enable
auditpol /set /Subcategory:"User/Device Claims" /success:enable /failure:enable
auditpol /set /Subcategory:"Group Membership" /success:enable /failure:enable
auditpol /set /Subcategory:"Logoff" /success:enable /failure:enable
auditpol /set /Subcategory:"Logon" /success:enable /failure:enable
auditpol /set /Subcategory:"Other Logon/Logoff Events" /success:enable /failure:enable
auditpol /set /Subcategory:"Special Logon" /success:enable /failure:enable
auditpol /set /Subcategory:"Detailed File Share" /success:enable /failure:enable
auditpol /set /Subcategory:"File Share" /success:enable /failure:enable
auditpol /set /Subcategory:"File System" /success:enable /failure:enable
auditpol /set /Subcategory:"Filtering Platform Connection" /failure:enable
auditpol /set /Subcategory:"Other Object Access Events" /success:enable /failure:enable
auditpol /set /Subcategory:"Registry" /success:enable /failure:enable
auditpol /set /Subcategory:"Removable Storage" /success:enable /failure:enable
auditpol /set /Subcategory:"Audit Policy Change" /success:enable /failure:enable
auditpol /set /Subcategory:"Authentication Policy Change" /success:enable /failure:enable
auditpol /set /Subcategory:"MPSSVC Rule-Level Policy Change" /success:enable /failure:enable
auditpol /set /Subcategory:"Other Policy Change Events" /success:enable /failure:enable
auditpol /set /Subcategory:"Other System Events" /success:enable /failure:enable
auditpol /set /Subcategory:"Security State Change" /success:enable /failure:enable
auditpol /set /Subcategory:"Security System Extension" /success:enable /failure:enable
auditpol /set /Subcategory:"System Integrity" /success:enable /failure:enable

auditpol /get /Category:*
