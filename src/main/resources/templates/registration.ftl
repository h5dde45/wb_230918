<#import "parts/common.ftl" as c>
<#import "parts/registration.ftl" as r>

<@c.page>
Add new user
<div>${message!}</div>
    <@r.registration />
</@c.page>