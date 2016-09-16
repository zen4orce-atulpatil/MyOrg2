<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Alert_New_Project_Assigned_To_Manager</fullName>
        <description>Email Alert New Project Assigned To Manager</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/new_project_is_assigned</template>
    </alerts>
    <alerts>
        <fullName>notification_mail_of_end_of_project</fullName>
        <description>notification mail of end of project</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Approve_New_Account</template>
    </alerts>
    <alerts>
        <fullName>remind_manager_about_end_date</fullName>
        <description>remind manager about end date</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Approve_New_Account</template>
    </alerts>
    <fieldUpdates>
        <fullName>project_status_closed</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>project status closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>project_status_update</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>project status update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>status_update</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>status update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_manager_email</fullName>
        <field>Manager_Email__c</field>
        <formula>Manager__r.Employee_Email__c</formula>
        <name>update manager email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_project_status</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>update project status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_project_status1</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>update project status1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>create a Calendar task</fullName>
        <actions>
            <name>Email_Alert_New_Project_Assigned_To_Manager</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>update_manager_email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>assigned_project</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>project status closed</fullName>
        <actions>
            <name>project_status_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>End_Date__c   -  TODAY() = 0</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>remind the Project Manager Closed Date</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Project_Details__c.Manager_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>remind_manager_about_end_date</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Project_Details__c.End_Date__c</offsetFromField>
            <timeLength>-5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>assigned_project</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>assigned project</subject>
    </tasks>
</Workflow>
