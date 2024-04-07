$ResourceGroupName="app-grp"
$WebAppName="webapp55434434"

$Properties =@{
    repoUrl="https://github.com/alashro/demoapp";
    branch="master";
    isManualIntegration="true";
}

Set-AzResource -ResourceGroupName $ResourceGroupName `
-Properties $Properties -ResourceType Microsoft.Web/sites/sourcecontrols `
-ResourceName $WebAppName/web -ApiVersion 2015-08-01 -Force