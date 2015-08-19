<?php
//Logging to apache2 log file
$fp = fopen('/var/log/apache2/apache2.log','a');

if($fp) {
	fwrite($fp,date('Y-m-d H:i:s').": Running rebuild from php script...\n");
}
$res = shell_exec('sh /opt/ng-amrs/rebuild.sh');

if($fp) {
	fwrite($fp, date('Y-m-d H:i:sa').": Done, rebuild finished running\n");
}
fclose($fp);
echo "Done....";
?>
