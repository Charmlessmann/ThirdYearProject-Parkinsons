% This is the script for feature selection for Bradykinesia Classification
% The inputs are composed from the optical flow results - 30 PFS

% Author: David Wong
% Date: 15/01/2019

% Update: 
% - add metrics of frequency variability
% - add metrics involving velocity (calculated from derivative)

% feature selection
% n.b. features are hand-cranked, having looked at the frequency spectra
% for the controls vs patients.

% features: 
% 1.) location of max spectral peak
% 2.) overall power in spectrum
% 3.) percentage power in power-bands

n = size(Controls,2);
w = hann(size(Controls,1));
spec_length = w/2;
% edit: CL 13/4/2021 change the number to fit my data
x = 1:328;
features = [];
test_power = [];


 for  i = 1:n
        pt_data = Controls{:,i};
        rng = max(pt_data) - min(pt_data);
        mean_pt_data = mean(pt_data);
    
        % normalise the data
        pt_data = (pt_data - mean_pt_data)/rng;
        windowed_data = pt_data .* w;
        Y = fft(windowed_data);
        abs_Y = abs(Y);
        
        %1.)get the max peak
        max_peak = find(abs_Y == max(abs_Y));
        
        %2.)get overall power
        Y2 = abs(Y.^2);
        total_power = sum(Y2);
        
        %3.)percentage power
        % edit: CL 13/4/2021 change the frequency bins interval
        prc_power = [sum(Y2(1:20)) sum(Y2(21:40)) sum(Y2(41:60)) sum(Y2(61:80)) sum(Y2(81:100)) sum(Y2(101:120))];
        prc_power = prc_power/total_power;
        test_power = [test_power; sum(Y2(1:120))/sum(Y2(1:150))];
        %new: include variability features
        [pks, locs] = findpeaks(pt_data,x);
        gm = fitgmdist(pks,2);
        
        %4.)ratio of max peaks to min peaks
        clust_max = find(gm.mu == max(gm.mu));
        clust_min = find(gm.mu == min(gm.mu));
        mix_ratio = gm.ComponentProportion(clust_max)/gm.ComponentProportion(clust_min);
        
        %5.)standard deviation of peak to peak distance
        idx = cluster(gm,pks);
        idx = find(idx == clust_max);
        upper_pk_loc = locs(idx);
        nn = diff(locs);
        st_dev = std(nn);
        
        
        features = [features; max_peak(1), total_power, prc_power, mix_ratio, st_dev 0];
 end
  
n = size(Patients,2);
w = hann(size(Patients,1));
spec_length = w/2;

 for  i = 1:n
        pt_data = Patients{:,i};
        rng = max(pt_data) - min(pt_data);
        mean_pt_data = mean(pt_data);
    
        % normalise the data
        pt_data = (pt_data - mean_pt_data)/rng;
        windowed_data = pt_data .* w;
        Y = fft(windowed_data);
        abs_Y = abs(Y);
        
        %1.)get the max peak
        max_peak = find(abs_Y == max(abs_Y));
        
        %2.)get overall power
        Y2 = abs(Y.^2);
        total_power = sum(Y2);
        
        %3.)percentage power
        % edit: CL 13/4/2021 change the frequency bins interval        
        prc_power = [sum(Y2(1:20)) sum(Y2(21:40)) sum(Y2(41:60)) sum(Y2(61:80)) sum(Y2(81:100)) sum(Y2(101:120))];
        prc_power = prc_power/total_power;
        test_power = [test_power; sum(Y2(1:120))/sum(Y2(1:150))];
        
        %new: include variability features
        [pks, locs] = findpeaks(pt_data,x);
        gm = fitgmdist(pks,2);
        
        %4.)ratio of max peaks to min peaks
        clust_max = find(gm.mu == max(gm.mu));
        clust_min = find(gm.mu == min(gm.mu));
        mix_ratio = gm.ComponentProportion(clust_max)/gm.ComponentProportion(clust_min);
        
        %5.)standard deviation of peak to peak distance
        idx = cluster(gm,pks);
        idx = find(idx == clust_max);
        upper_pk_loc = locs(idx);
        nn = diff(locs);
        st_dev = std(nn);
        
        features = [features; max_peak(1), total_power, prc_power, mix_ratio, st_dev, 1];
 end
 
 % edit: DW 15/01/2019. I'm such an idiot. Need to normalise the features,
 % else the feature with biggest variance always dominates...
 % edit: CL 13/4/2021 changed 2:10 to 1:10
 for i = 1:10;
     stdev = std(features(:,i));
     avg = mean(features(:,i));
     
     features(:,i) = (features(:,i) - avg) / stdev;
 end
 
 
 %visualise features using PCA
 [coeff, score, latent] = pca(features(:,1:10));
 figure
 scatter(score(1:32,1),score(1:32,2),'rx')
 hold on
 scatter(score(33:end,1),score(33:end,2),'bo')
 figure
 scatter3(score(1:32,1),score(1:32,2),score(1:32,3),'r')
 hold on
 scatter3(score(33:end,1),score(33:end,2),score(33:end,3),'b')
 
 PCA_features_C = score(1:32,1:2);
 PCA_features_P = score(33:end,1:2);
