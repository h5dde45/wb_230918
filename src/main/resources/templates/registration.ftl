<#import "parts/common.ftl" as c>
<#import "parts/registration.ftl" as r>

<@c.page>
<div class="mb-3">
    Add new user
</div>
<div>${message!}</div>
    <@r.registration />
</@c.page>