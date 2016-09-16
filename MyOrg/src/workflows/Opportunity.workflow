<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>send_email_to_opp_owner_abt_big_deal</fullName>
        <description>send email to opp owner abt big deal</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Big_Deal_Created</template>
    </alerts>
    <fieldUpdates>
        <fullName>Status_Approved</fullName>
        <field>Discount_Percent__c</field>
        <name>Status Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Not_Approved</fullName>
        <field>Discount_Percent__c</field>
        <name>Status Not Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>approval_Status</fullName>
        <field>status__c</field>
        <literalValue>Prospect</literalValue>
        <name>approvalStatus1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>approve</fullName>
        <field>status__c</field>
        <literalValue>Customer</literalValue>
        <name>approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>pending</fullName>
        <field>status__c</field>
        <literalValue>Pending</literalValue>
        <name>pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>rejectStatus</fullName>
        <field>status__c</field>
        <literalValue>Prospect</literalValue>
        <name>rejectStatus</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>reject_Status</fullName>
        <field>status__c</field>
        <name>rejectStatus1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>NextValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Big Deal Created</fullName>
        <actions>
            <name>send_email_to_opp_owner_abt_big_deal</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Negotiation/Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterThan</operation>
            <value>50000</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
