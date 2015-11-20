<%-- 
    Document   : RunTest2
    Created on : 14 oct. 2015, 16:07:31
    Author     : cerberus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="include/dependenciesInclusions.html" %>
        <script type="text/javascript" src="js/pages/RunTest.js"></script>
        <title>Run Test</title>
    </head>
    <body>
        <%@ include file="include/header.html"%>
        <div class="container-fluid center" id="page-layout">
            <%@ include file="include/messagesArea.html"%>
            <h1 class="page-title-line">Run Test</h1>
            <div class="col-lg-9">
                <div class="panel panel-default">
                    <div class="panel-heading card" data-toggle="collapse" data-target="#filtersPanel">
                        <span class="toggle glyphicon glyphicon-chevron-right pull-right"></span>
                        Filters
                    </div>
                    <div class="panel-body collapse in" id="filtersPanel">
                        <div class="row">
                            <div class="form-group col-lg-9">
                                <label class="control-label" for="typeSelect">Type of selection</label>
                                <select class="form-control input-sm" id="typeSelect">
                                    <option value="filters">Select a list of test</option>
                                    <option value="campaign">Select a campaign</option>
                                </select>
                            </div>
                        </div>
                        <form id="filters">
                            <div class="row">
                                <div class="form-group col-xs-2">
                                    <label id="lbl_test" for="testFilter">Test</label>                                     
                                    <select class="multiselectelement form-control" multiple="multiple" id="testFilter"></select>
                                </div>
                                <div class="form-group col-xs-2">
                                    <label id="lbl_project" for="projectFilter">Project</label>
                                    <select class="multiselectelement form-control" multiple="multiple" id="projectFilter"></select>
                                </div>
                                <div class="form-group col-xs-2">
                                    <label id="lbl_application" for="applicationFilter">Application</label>
                                    <select class="multiselectelement form-control" multiple="" id="applicationFilter"></select>
                                </div>
                                <div class="form-group col-xs-2">
                                    <label id="lbl_creator" for="creatorFilter">Creator</label>
                                    <select class="multiselectelement form-control" multiple="" id="creatorFilter"></select>
                                </div>
                                <div class="form-group col-xs-2">
                                    <label id="lbl_implementer" for="implementerFilter">Implementer</label>
                                    <select class="multiselectelement form-control" multiple="" id="implementerFilter"></select>
                                </div>
                                <div class="form-group col-xs-2">
                                    <label id="lbl_group" for="groupFilter">Group</label>                                     
                                    <select class="multiselectelement form-control" multiple="multiple" id="groupFilter"></select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-xs-2">
                                    <label id="lbl_campaign" for="campaignFilter">Campaign</label>                                     
                                    <select class="multiselectelement form-control" multiple="multiple" id="campaignFilter"></select>
                                </div>
                                <div class="form-group col-xs-2">
                                    <label id="lbl_testBattery" for="testBatteryFilter">Test Battery</label>                                     
                                    <select class="multiselectelement form-control" multiple="multiple" id="testBatteryFilter"></select>
                                </div>
                                <div class="form-group col-xs-2">
                                    <label id="lbl_priority" for="priorityFilter">Priority</label>                                     
                                    <select class="multiselectelement form-control" multiple="multiple" id="priorityFilter"></select>
                                </div>
                                <div class="form-group col-xs-2">
                                    <label id="lbl_status" for="statusFilter">Status</label>                                     
                                    <select class="multiselectelement form-control" multiple="multiple" id="statusFilter"></select>
                                </div>
                                <div class="form-group col-xs-2">
                                    <label id="lbl_targetRev" for="targetRevFilter">Target Revision</label>                                     
                                    <select class="multiselectelement form-control" multiple="multiple" id="targetRevFilter"></select>
                                </div>
                                <div class="form-group col-xs-2">
                                    <label id="lbl_targetSprint" for="targetSprintFilter">Target Sprint</label>                                     
                                    <select class="multiselectelement form-control" multiple="multiple" id="targetSprintFilter"></select>
                                </div>
                            </div>
                        </form>
                        <form id="campaignSelection" style="display: none;">
                            <div class="form-group col-lg-9">
                                <label id="lbl_campaignSelection" for="campaignSelect">Select a campaign</label>
                                <select class="form-control input-sm" id="campaignSelect"></select>
                            </div>
                        </form>
                        <button type="button" class="btn btn-primary" id="loadbutton">Load</button>
                        <button type="button" class="btn btn-default" id="resetbutton">Reset Filters</button>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        Choose Test
                    </div>
                    <div class="panel-body" id="chooseTest">
                        <div class="row">
                            <div class="form-group col-lg-9">
                                <select multiple id="testCaseList" class="form-control" style="height: 300px;"></select>
                            </div>
                            <div class="col-lg-3">
                                <div class="row" style="margin-top: 100px;">
                                    <button type="button" class="btn btn-default" id="addQueue"> > </button>
                                </div>
                                <div class="row" style="margin-top: 5px;">
                                    <button type="button" class="btn btn-default" id="addAllQueue"> >> </button>
                                </div>
                                <div><p id="error"></p></div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col-lg-6">
                                <label class="bold">Environment :</label>
                                <label class="radio-inline">
                                    <input name="envSettings" value="auto" checked type="radio">Automatic
                                </label>
                                <label class="radio-inline">
                                    <input name="envSettings" value="manual" type="radio">Manual
                                </label>
                                <form id="envSettingsAuto">
                                    <select multiple class="form-control" name="environment"></select>
                                </form>
                                <form id="envSettingsMan" style="display: none;" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="myhost" class="col-sm-3 control-label bold">My Host</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control input-sm" id="myhost" name="myhost"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="mycontextroot" class="col-sm-3 control-label bold">My Context Root</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control input-sm" id="mycontextroot" name="mycontextroot"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="myloginrelativeurl" class="col-sm-3 control-label bold">My Login Relative URL</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control input-sm" id="myloginrelativeurl" name="myloginrelativeurl"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="myenvdata" class="col-sm-3 control-label bold">My Data Environment</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="myenvdata" name="myenvdata"></select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-6">
                                <label for="countryList" id="countryListLabel" class="bold">Country List :</label>
                                <div id="countryList" name="countryList" style="padding-top: 4%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Robot settings
                            </div>
                            <div class="panel-body" id="robotSettings">
                                <form class="form-horizontal" id="robotSettingsForm">
                                    <div class="form-group">
                                        <label for="robotConfig" class="col-sm-3 control-label bold">Select Robot Config</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="robotConfig" name="robotConfig"></select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="seleniumIP" class="col-sm-3 control-label bold">Selenium Server IP</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control input-sm" id="seleniumIP" name="seleniumIP"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="seleniumPort" class="col-sm-3 control-label bold">Selenium Server Port</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control input-sm" id="seleniumPort" name="seleniumPort"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="browser" class="col-sm-3 control-label bold">Browser</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="browser" name="browser" multiple></select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="version" class="col-sm-3 control-label">Version (Optional)</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control input-sm" id="version" name="version"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="platform" class="col-sm-3 control-label">Platform (Optional)</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="platform" name="platform"></select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="screenSize" class="col-sm-3 control-label bold">Screen Size</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="screenSize" name="screenSize"></select>
                                        </div>
                                    </div>
                                </form>
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button class="btn btn-default btn-sm pull-right" id="saveRobotPreferences">Record my Robot Preferences</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Execution settings
                            </div>
                            <div class="panel-body" id="executionSettings">
                                <form class="form-horizontal"id="executionSettingsForm">
                                    <div class="form-group">
                                        <label for="tag" class="col-sm-3 control-label bold">Tag</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control input-sm" id="tag" name="tag"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="outputFormat" class="col-sm-3 control-label bold">Output Format</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="outputFormat" name="outputFormat"></select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="verbose" class="col-sm-3 control-label bold">Verbose</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="verbose" name="verbose"></select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="screenshot" class="col-sm-3 control-label bold">Screenshot</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="screenshot" name="screenshot"></select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pageSource" class="col-sm-3 control-label bold">Page Source</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="pageSource" name="pageSource"></select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="seleniumLog" class="col-sm-3 control-label bold">Selenium Log</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="seleniumLog" name="seleniumLog"></select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="synchroneous" class="col-sm-3 control-label bold">Synchroneous</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="synchroneous" name="synchroneous"></select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="timeout" class="col-sm-3 control-label bold">Timeout</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control input-sm" id="timeout" name="timeout"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="retries" class="col-sm-3 control-label bold">Retries</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="retries" name="retries"></select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="manualExecution" class="col-sm-3 control-label bold">Manual Execution</label>
                                        <div class="col-sm-9">
                                            <select class="form-control input-sm" id="manualExecution" name="manualExecution"></select>
                                        </div>
                                    </div>
                                </form>
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button type="" class="btn btn-default btn-sm pull-right" id="saveExecutionParams">Record my Execution Parameters</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <footer class="footer">
                    <div class="container-fluid" id="footer"></div>
                </footer>
            </div>
            <div class="col-lg-3 pull-right">
                <div class="panel panel-default">
                    <div class="panel-heading card" data-toggle="collapse" data-target="#queuePanel">
                        <span class="toggle glyphicon glyphicon-chevron-right pull-right"></span>
                        <button class="btn btn-default btn-xs pull-right" id="resetQueue">Reset Queue</button>
                        Queue
                    </div>

                    <div class="panel-body collapse in" id="queuePanel">
                        <div><p id="notValid"></p></div>
                        <ul class="list-group" id="queue" style="height: 1200px; overflow: hidden; overflow-y: scroll;border: 1px solid #CCC; border-radius: 4px;"></ul>
                    </div>
                </div>
                <p>Launching N tests on the environments : TATA, TITI, TOTO in the countries : FR, IT, BE on the browser : firefox, chrome, android</p>
                <div style="padding-top: 15px;">
                    <button type="button" class="btn btn-primary btn-lg btn-block">Run</button>
                </div>
            </div>
        </div>
    </body>
</html>
