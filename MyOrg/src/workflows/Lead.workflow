<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_to_lead_owner_for_follow_up</fullName>
        <description>Email to lead owner for follow-up</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/follo_up_of_lead</template>
    </alerts>
    <fieldUpdates>
        <fullName>update_record_type_to_DNC</fullName>
        <field>RecordTypeId</field>
        <lookupValue>DNC_RT</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>update record type to DNC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_record_type_to_landline</fullName>
        <field>RecordTypeId</field>
        <lookupValue>LANDLINE_RT</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>update record type to landline</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_record_type_to_mobile</fullName>
        <field>RecordTypeId</field>
        <lookupValue>MOBILE_RT</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>update record type to mobile</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_record_type_to_no_number</fullName>
        <field>RecordTypeId</field>
        <lookupValue>NO_NUMBER_RT</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>update record type to no number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>follow-up of lead</fullName>
        <actions>
            <name>Email_to_lead_owner_for_follow_up</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>follow_up__c  &gt;=  TODAY()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>select DNS record type</fullName>
        <actions>
            <name>update_record_type_to_DNC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DNC__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>select landline record type</fullName>
        <actions>
            <name>update_record_type_to_landline</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.LANDLINE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>select mobile record type</fullName>
        <actions>
            <name>update_record_type_to_mobile</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.MOBILE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>select no number record type</fullName>
        <actions>
            <name>update_record_type_to_no_number</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.NO_NUMBER__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>if no number checkbox selected then create no number record type</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
