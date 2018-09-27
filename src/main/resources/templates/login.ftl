<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div>${message!}</div>
<@l.login />
</@c.page>