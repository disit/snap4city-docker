config = {
	"verbose": true,
	"synOwnElmtType": "SynopticID",
	"keycloakAuth": "http://dashboard/auth/",
	"srvSrcReq": "synopticserver",
	"synSvg": "http://dashboard/dashboardSmartCity/img/synoptics/{0}.svg",
	"getOneKpiValue": "http://dashboard/datamanager/api/v1/kpidata/{0}/values?last=1&accessToken={1}&sourceRequest={2}&sourceId={3}",
	"getOnePublicKpiValue": "http://dashboard/datamanager/api/v1/public/kpidata/{0}/values?sourceRequest={1}&sourceId={2}",
	"getOneSensorValue": "http://dashboard/ServiceMap/api/v1/?serviceUri={0}&valueName={1}&accessToken={2}",
	"getOnePublicSensorValue": "http://dashboard/ServiceMap/api/v1/?serviceUri={0}&valueName={1}",
	"setValue": "http://dashboard/datamanager/api/v1/kpidata/{0}/values?accessToken={1}&sourceRequest={2}&sourceId={3}",
	"getDashboardData": "http://dashboard/dashboardSmartCity/management/getDashboardData.php?dashboardId={0}"
};
