<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Case_to_Escalated</fullName>
        <field>IsEscalated</field>
        <literalValue>1</literalValue>
        <name>Set Case to Escalated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_case_owner</fullName>
        <field>OwnerId</field>
        <lookupValue>queue_to_handle_case</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>update case owner</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Case Escalate on High Priority</fullName>
        <actions>
            <name>Set_Case_to_Escalated</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Follow_Up_on_Escalated_Case</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>High</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>assign case to queue</fullName>
        <actions>
            <name>update_case_owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>Follow_Up_on_Escalated_Case</fullName>
        <assignedTo>atul.patil@zen4orce.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow Up on Escalated Case</subject>
    </tasks>
</Workflow>
