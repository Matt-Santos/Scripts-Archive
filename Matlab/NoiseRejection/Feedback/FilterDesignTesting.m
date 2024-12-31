clf;

%PreGain Amplifier
PG = tf(1);
%Post Feedback Amplifier
FG = tf(1);
%Create Sensor
forward_num = [-40596496340164.1,-10055203430225.6,7778571084474.48];
forward_den = [1,3502079.68268747,5589807862084.53,40022776635817.3,58077323621970.0];
forward = tf(forward_num,forward_den,0);
ref_num = [12605.4554063995,23229713663.4924,17234152953470.8,4398216306223.24,3018119162321.11];
ref_den = [1,1423447.52999193,9421519136.03560,6422247005442.77,51913333436888.3,69117764201530.7];
ref = tf(ref_num,ref_den,0);
Sensor = PG*tf({forward_num ref_num},{forward_den ref_den},0);
Sensor.InputName = ['x1';'x2'];
Sensor.OutputName = 'y';
%Specifiically Designed Feedback Filter (High Acc, hard implementation)
filter_num = [-178420346.627485 -6336128258.59325 -56252722949.1992];
filter_den = [1 3950371.34849604 2417226.48105726 563973215830.732 0];
Filter = FG*tf(filter_num,filter_den,0);
Filter.InputName = 'y';
Filter.OutputName = 'x2';
%Construct Aqusition System
result = connect(Sensor,Filter,'x1','y');
%Construct Test with signal
load('SampleSignal.mat');
QRSwave=Orig_Sig';
t=[0:length(QRSwave)-1]/500;
tx = [0:20*(length(QRSwave)-1)]/10000;
QRSwave = interp1(t,QRSwave,tx);
QRSwave = 2*normalize(QRSwave,'range')-1;
QRSwave = QRSwave*0.01; %Scale to 1mV
Orig_Sig = QRSwave;
QRSwave = QRSwave+0.8*sin(2*pi.*tx.*60);

%Approximate Descrite System Models (for lsim)
D_Filter  = c2d(Filter,0.000001,'turtin');
D_forward = c2d(forward,0.000001,'turtin');
D_ref     = c2d(ref,0.000001,'turtin');
D_result  = c2d(result,0.000001,'turtin');

%Perform Analysis
figure(1);title('Filter Transfer Function');
bode(Filter,D_Filter);legend('Continous','Discrete');
figure(2);title('Sensor Transfer Function');
subplot(1,2,1);bode(forward,D_forward);legend('Continous','Discrete');
subplot(1,2,2);bode(ref,D_ref);legend('Continous','Discrete');
figure(3);title('Overall Transfer Function');
a = fill([1 100 100 1],[-40 -40 40 40],'blue');
a.FaceAlpha = 0.1;
hold on;bode(result,D_result);legend('Continous','Discrete');
a = fill([1 100 100 1],[0 0 500 500],'blue');
a.FaceAlpha = 0.1;
%Stability Sanity Check
isstable(result)

figure(4);
%subplot(2,1,1);
lsim(connect(Sensor,Filter,'x1','y'),QRSwave,tx);title('Overall Response');
%subplot(2,1,2);
%lsim(connect(Sensor,Filter,'x1','x2'),QRSwave,tx);title('Filter');
