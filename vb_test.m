%% determine url

% For each request to TVB, we need to know it's address. Upon
% launching TVB, a web browser window opens; please copy that address
% here if it is different:

sv = vb_url('http://127.0.0.1:8080/user/')

%% set the number of CPUs used for simulations
vb_reset(sv, 2)

%% get info on classes in TVB
vb = vb_dir(sv);

% after this call, try TAB-complete on the struct vb. This will provide
% a list of modules, where you can choose the module and then tab complete
% to obtain a list of classes, e.g.

% >>> vb.<TAB>         
% >>> vb. [ models   ]
%         [ monitors ]
%            ....
%
% >>> vb.models.<TAB>
% >>> vb.models. [ JansenRit  ]
%                    ....

%% info on individual class

% If you evaluate, e.g. vb.models.JansenRit, you obtain the help for this
% class, along with a list of attributes

vb.models.JansenRit

%% try a simulation

sim = [];

% where to put data files
sim.wd = pwd; 

% how long to simulate (ms)
sim.tf = 5e1;

sim.model.class = vb.models.Generic2dOscillator;
%opt.model.a = -2.1;

sim.connectivity.class = 'Connectivity';
sim.connectivity.speed = 4.0;

sim.coupling.class = 'Linear';
sim.coupling.a = 0.002;

sim.integrator.class = 'HeunDeterministic';
sim.integrator.dt = 1e-2;

sim.monitors{1}.class = 'TemporalAverage';

%sim.monitors{2}.class = 'Raw';
%sim.monitors{2}.period = 1.0; % ms

[id, data] = vb_new(sv, sim);

plot(data.mon_0_TemporalAverage.ts, squeeze(data.mon_0_TemporalAverage.ys)')



