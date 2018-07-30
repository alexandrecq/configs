rsync -Cavz /home/alex/data/in/Sony_Stage_6-26-2018/data /mnt/e/Sony_Stage_6-26-2018/
rm -r /mnt/e/Sony_Stage_6-26-2018/data
sudo rsync -Cavz /home/alex/data/in/Sony_Stage_6-26-2018/data /mnt/e/Sony_Stage_6-26-2018/
sudo rsync -Cavz /home/alex/data/in/Sony_Stage_6-26-2018/metadata /mnt/e/Sony_Stage_6-26-2018/
cat calibration_extrinsic/02x05,02x04/extrinsic.json 
cd ../Radiant_Calibration_TEST/
cat calibration_extrinsic/00x00,01x01/extrinsic.json 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Radiant_Calibration_TEST/iframes/00x00/clip000_frame240.png ~/data/in/Radiant_Calibration_TEST/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Radiant_Calibration_TEST/calibration_intrinsic/ --pattern_sizes 9:19-10:18 --rig_type multiple --ref_camera_uv 1,1 --pattern circles
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
ll ..
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_noclustering  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
cat ../Sony_Stage_6-26-2018/calibration_extrinsic_noclustering/00x00,02x04/extrinsic.json 
cat ../Sony_Stage_6-26-2018/calibration_extrinsic/00x00,02x04/extrinsic.json 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_clustering  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
eog&
vsui
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_roll  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type single --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_roll_all  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type single --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
cd data/in/Sony_Stage_6-26-2018/
lll calibration_extrinsic_roll_all/
mkdir measured_features
ll calibration_ext*
mv calibration_extrinsic/cg_meas.pkl measured_features/cg_meas_stills.pkl

mv calibration_extrinsic_roll_all/cg_meas.pkl measured_features/cg_meas_roll_all.pkl
ls measured_features/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py blah --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features  --out_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic_combined
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py ./00x00 --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features  --out_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic_combined
lll calibration_intrinsic_combined/
cat calibration_intrinsic_combined/intrinsic.json 
rm -r calibration_intrinsic/*
mv measured_features/cg_meas_roll.pkl .
rm -r calibration_intrinsic_combined/
python -m calibrate_all_cameras 
mv calibration_intrinsic_combined/ calibration_intrinsic
cat missing_cameras.csv 
lll 
rm cg_meas.pkl 
lll calibration_extrinsic_clustering/
lll calibration_extrinsic_combined/
ls
cp cg_meas_roll_all.pkl measured_features/
mv cg_meas_roll_all.pkl measured_features/
cd measured_features/
mv cg_meas_stills.pkl ../calibration_extrinsic/cg_meas.pkl
man ln
ln -s ./cg_meas_stills.pkl ../calibration_extrinsic/cg_meas.pkl 
ln -s ../calibration_extrinsic/cg_meas.pkl ./cg_meas_stills.pkl
mv cg_meas_roll.pkl ../calibration_extrinsic_roll/cg_meas.pkl
ln -s ../calibration_extrinsic_roll/cg_meas.pkl ./cg_meas_roll.pkl
mv cg_meas_roll_all.pkl ../calibration_extrinsic_roll_all/cg_meas.pkl
ln -s ../calibration_extrinsic_roll_all/cg_meas.pkl ./cg_meas_roll_all.pkl
ll
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py ./00x00 --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features  --out_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic_combined --ref_camera_uv 2,4
cd .vim/
cd ../.vim_runtime/
vi -s
vi -S
vi Software/v_suite/v_scripts/calibrate_all_cameras.py 
cd ../.vim_runtime/
vi -s
vi -S
vi Software/v_suite/v_scripts/calibrate_all_cameras.py 
cd /mnt/Vi
cd /mnt/c/Visby/
mkdir tika
mv best_mesh.obj tika/
mv fire_1024_7_semif.vvf tika/
mv fire_clip_25_frame_5360.vvf tika/
ls LocalExpStereo/
ls local_expVS/
ls local_expVS/2048/
eog local_expVS/256/imL.png 
ls data/unreal_2048_2048_7_7_nominal/
mkdir data/unreal_room
mv local_expVS data/unreal_room/
chmod -R 775 .
sudo mv local_expVS data/unreal_room/
sudo mv local_expVS ./data/unreal_room/
mv data/unreal_2048_2048_7_7_nominal data/unreal_room/
ls data
ll data
ll .
tree
ll
ls
cd LocalExpStereo/
git st
git df
git df
vsui
python Software/py-ibr2/tests/test_ibr.py 
cd Software/v_suite/
cd ../py-ibr2/
nosetest
nosetests
which nosetests
conda list numpy
conda list nose
conda list ipython
conda list imageio
conda list ipdb
python -m paris_ibr
python -m tika
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_noclustering  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
cat ../Sony_Stage_6-26-2018/calibration_extrinsic_noclustering/00x00,02x04/extrinsic.json 
cat ../Sony_Stage_6-26-2018/calibration_extrinsic/00x00,02x04/extrinsic.json 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_clustering  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
eog&
cd data/in/Sony_Stage_6-26-2018/
ls
ls calibration_extrinsic/
ls calibration_extrinsic_clustering/
ls calibration_extrinsic_noclustering/
htop
ll calibration_intrinsic/
ll calibration_intrinsic_combined/
ls calibration_intrinsic/
rm -r calibration_intrinsic
fg
source ~/.bash_history 
source ~/.bashrc 
vsui
ipython 
vsui
ipython 
cd Software/python_scripts/
ls
lll
vi mask_localexp_depth.py 
chmod -R 775 .
sudo mv local_expVS data/unreal_room/
sudo mv local_expVS ./data/unreal_room/
mv data/unreal_2048_2048_7_7_nominal data/unreal_room/
ls data
ll data
ll .
tree
ll
cd LocalExpStereo/
git df
git df
python Software/py-ibr2/tests/test_ibr.py 
cd Software/v_suite/
cd ../py-ibr2/
nosetest
nosetests
which nosetests
conda list numpy
conda list nose
conda list ipython
conda list imageio
conda list ipdb
python ~/Software/v_suite/v_suite/v_experiments/run_flow.py 
..
cd alex/
.
source ~/.bashrc
vusi
vsui
rm Session.vim 
cat vsui.txt 
mv vsui.txt conda_vsui.txt
ls Software/
cd Software/
ls v_suite/v_scripts/
ls python_scripts/
ls python_scripts/cali*
mv calibrate_all_cameras.py  v_suite/v_scripts/
python -m run_flow
conda install pyfusion
conda install pyfusion -c conda-forge
git clone https://github.com/griegler/pyfusion.git pyfusion
cd pyfusion/
cd ..
mkidr repos
mkdir repos
mv boofcv gcc* opencv* repos
ls repos
ls cplus
ls utils/
rm -r utils/
mkdir install_scripts
mv install* install_scripts/
ls calibration_sandbox/
mv pyfusion repos/
mv repos ../
cd ../repos/pyfusion/
cd buid
cd build
git st
mkdir build
cd build/
cmake ..
cd ../../../Software/v_suite/
ls
cat requirements.in 
ls v_suite/v_binaries/
ls v_suite/v_binaries/local_exp/
python
python -m run_flow ~/Software/v_suite/v_suite/v_experiments/domains/unreal_room/config/unreal_room_2048_2048_mesh_raycast.ini 
python -m ipdb ~/Software/v_suite/v_suite/v_experiments/run_flow ~/Software/v_suite/v_suite/v_experiments/domains/unreal_room/config/unreal_room_2048_2048_mesh_raycast.ini 
python -m ipdb ~/Software/v_suite/v_suite/v_experiments/run_flow.py ~/Software/v_suite/v_suite/v_experiments/domains/unreal_room/config/unreal_room_2048_2048_mesh_raycast.ini 
ipython 
mv measured_features/cg_meas_roll.pkl .
rm -r calibration_intrinsic_combined/
python -m calibrate_all_cameras 
mv calibration_intrinsic_combined/ calibration_intrinsic
cat missing_cameras.csv 
lll 
rm cg_meas.pkl 
lll calibration_extrinsic_clustering/
lll calibration_extrinsic_combined/
cp cg_meas_roll_all.pkl measured_features/
mv cg_meas_roll_all.pkl measured_features/
cd measured_features/
mv cg_meas_stills.pkl ../calibration_extrinsic/cg_meas.pkl
man ln
ln -s ./cg_meas_stills.pkl ../calibration_extrinsic/cg_meas.pkl 
ln -s ../calibration_extrinsic/cg_meas.pkl ./cg_meas_stills.pkl
mv cg_meas_roll.pkl ../calibration_extrinsic_roll/cg_meas.pkl
ln -s ../calibration_extrinsic_roll/cg_meas.pkl ./cg_meas_roll.pkl
mv cg_meas_roll_all.pkl ../calibration_extrinsic_roll_all/cg_meas.pkl
ln -s ../calibration_extrinsic_roll_all/cg_meas.pkl ./cg_meas_roll_all.pkl
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py ./00x00 --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features  --out_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic_combined --ref_camera_uv 2,4
cd .vim/
cd ../.vim_runtime/
vi -s
vi -S
vi Software/v_suite/v_scripts/calibrate_all_cameras.py 
cd ../.vim_runtime/
vi -s
vi -S
vi Software/v_suite/v_scripts/calibrate_all_cameras.py 
cd /mnt/Vi
cd /mnt/c/Visby/
mkdir tika
mv best_mesh.obj tika/
mv fire_1024_7_semif.vvf tika/
mv fire_clip_25_frame_5360.vvf tika/
ls LocalExpStereo/
ls local_expVS/
ls local_expVS/2048/
eog local_expVS/256/imL.png 
ls data/unreal_2048_2048_7_7_nominal/
mkdir data/unreal_room
mv local_expVS data/unreal_room/
chmod -R 775 .
sudo mv local_expVS data/unreal_room/
sudo mv local_expVS ./data/unreal_room/
mv data/unreal_2048_2048_7_7_nominal data/unreal_room/
ls data
ll data
ll .
tree
cd LocalExpStereo/
git st
git df
git df
python Software/py-ibr2/tests/test_ibr.py 
cd Software/v_suite/
cd ../py-ibr2/
nosetest
nosetests
which nosetests
conda list numpy
conda list nose
conda list ipython
conda list imageio
conda list ipdb
cd /data/
cd data/unreal_room/
ls out_py-ibr2/
mkdir out_py_ibr
ls depth/rgb/

python -m ipdb ~/Software/py_ibr/py_ibr/paris_ibr
python -m ipdb ~/Software/py_ibr/py_ibr/paris_ibr.py
ls ../tika/
python -m ipdb ~/Software/py_ibr/py_ibr/paris_ibr.py 
source ~/.bashrc 
vsui
python -m vsuite.vscripts.calibrate_camera
python -m v_suite.v_scripts.calibrate_camera
python -m v_suite.calibrate_camera
python -m v_suite
python -m v_suite.v_utils.cv_utils
python -m v_suite.v_experiments run_flow
python -m v_suite.v_experiments.run_flow
python -m v_suite.v_outputs.out_extrinsics
python -m v_suite.v_outputs.out_extrinsic
ls ~/Software/v_suite/v_suite/v_outputs/out_extrinsics.py 
ll ~/Software/v_suite/v_suite/v_outputs/out_extrinsics.py 
ll ~/Software/v_suite/v_suite/v_experiments/run_flow.py 

pyhton -m paris_ibr
lll out_corners/
lll out_py_ibr/
rm -r  out_full out_rows135 out_corners/

python ~/Software/py_ibr/py_ibr/paris_ibr.py 
mv out_py_ibr/paris_lf.npz .
ls out_py_ibr/
rm out_py_ibr/paris_lf.npz 
python -m paris_ibr
python -m render_novel_views

python -m ipdb ~/Software/py_ibr/py_ibr/render_novel_views.py 
c
rm paris_lf_bu.npz 
ls unreal_2048_2048_7_7_nominal/
ls ../fire_clip_25_frame_5386_color_corrected/
ls ../fire_clip_25_frame_5386_color_corrected/best_respaced/
ls ../fire_clip_25_frame_5386_color_corrected/best_respaced/out_lf_x/
python -m ipdb ~/Software/py_ibr/py_ibr/run_ibr.py 
python -m tika
mv paris_lf.npz paris_lf_bu.npz
cp paris_lf_bu.npz paris_lf.npz 
ll
rm paris_lf.npz 
python -m run_ibr
ls depth/
cd ../
cd 2018-05-14_sony/
cd ../2018-06-26_sony/
ls
ls measured_features/
ll measured_features/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py  --intrinsics_dir ./calibration_intrinsic/ --measurement_pkl ./--ref_camera_uv 2,4 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py  blah ./calibration_extrinsic_leftright --intrinsics_dir ./calibration_intrinsic/ --measurement_pkl ./--ref_camera_uv 2,4 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py  blah ./calibration_extrinsic_leftright --intrinsics_dir ./calibration_intrinsic/ --measurement_pkl ./measured_features/cg_meas_stills.pkl --ref_camera_uv 2,4 
lll
python -m  ~/Software/v_suite/v_scripts/calibrate_rig.py  blah ./calibration_extrinsic_leftright --intrinsics_dir ./calibration_intrinsic/ --measurement_pkl ./measured_features/cg_meas_stills.pkl --ref_camera_uv 2,4 

rm calibration_extrinsic_leftright/
rm calibration_extrinsic_leftright/*
rm -r calibration_extrinsic_leftright/*
python -m  calibrate_rig  blah ./calibration_extrinsic_leftright --intrinsics_dir ./calibration_intrinsic/ --measurement_pkl ./measured_features/cg_meas_stills.pkl --ref_camera_uv 2,4 
ls measured_features/
ll measured_features/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py  --intrinsics_dir ./calibration_intrinsic/ --measurement_pkl ./--ref_camera_uv 2,4 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py  blah ./calibration_extrinsic_leftright --intrinsics_dir ./calibration_intrinsic/ --measurement_pkl ./--ref_camera_uv 2,4 
lll
python -m  ~/Software/v_suite/v_scripts/calibrate_rig.py  blah ./calibration_extrinsic_leftright --intrinsics_dir ./calibration_intrinsic/ --measurement_pkl ./measured_features/cg_meas_stills.pkl --ref_camera_uv 2,4 
rm calibration_extrinsic_leftright/
rm calibration_extrinsic_leftright/*
vsui
cd data/2018-06-26_sony/
rm -r calibration_extrinsic_leftright/*
python -m  calibrate_rig  blah ./calibration_extrinsic_leftright --intrinsics_dir ./calibration_intrinsic/ --measurement_pkl ./measured_features/cg_meas_stills.pkl --ref_camera_uv 2,4 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py  blah ./calibration_extrinsic_leftright --intrinsics_dir ./calibration_intrinsic/ --measurement_pkl ./measured_features/cg_meas_stills.pkl --ref_camera_uv 2,4 
lll calibration_extrinsic_leftright/
lll calibration_extrinsic_leftright | wc
ll calibration_extrinsic_leftright | wc
ll calibration_extrinsic_leftright
vi vimrcs/plugins_config.vim 
ack g:ale_fixers
rm -r sources_non_forked/bufexplorer
ls forked_disabled/
ls non_forked_disabled/
rm -r forked_disabled/
rm -r sources_non_forked/comfortable-motion.vim/
rm Session.vim 
vi my_configs.vim 
ls sources_non_forked/
mv sources_non_forked/auto-pairs/ non_forked_disabled/
wget ps://gist.github.com/xen/6334976.js"></script>
wget https://gist.githubusercontent.com/xen/6334976/raw/7e3061b395a2e635dcda86371c1414ce0c7c35bc/.pylintrc
curl https://gist.githubusercontent.com/xen/6334976/raw/7e3061b395a2e635dcda86371c1414ce0c7c35bc/.pylintrc -o ~/.pylintrc_xen
lll ~/
la -lrt ~/
vi ~/.pylintrc 
rm ~/.pylintrc_xen 
ffg
cd Software/v_suite/v_scripts/
cd ../v_suite/
ls v_outputs/
vi v_outputs/out_matrix.py 
l
ack Image
git df v_scripts/calibrate_all_cameras.py
git add v_scripts/calibrate_all_cameras.py 
git ci -m "Working with Radiant data."
addkey 
git fetch origin
git checkout -b feat/gcnet origin/feat/gcnet 
git merge master
vi v_suite/v_apis/cv_api.py 
vi v_suite/v_preprocessors/pre_resize_views.py 
git df v_scripts/hdd_copy.py
git add v_suite/v_apis/cv_api.py 
git add v_suite/v_preprocessors/pre_resize_views.py 
git co master
git co feat/gcnet 
rm ../python_scripts/pairwise_rectify_depth.py 
pylint ../python_scripts/test_findCirclesgrid.py 
git ci -m "Minor fixes."
vi ~/.bashrc
cd Software/v_suite/
vi v_scripts/calibrate_rig.py 
git stash
git co feat/extract_points 
vi v_scripts/extrinsics_pair.py 
git co circles 
git add -u
git ci -m "Working feature extraction for stills."
git df v_scripts/calibrate_rig.py
git df v_suite/v_utils/file_utils.py
git add v_suite/v_utils/file_utils.py 
git ci "bug fix."
git ci -m "bug fix."
git ci -m "Single file, single pattern working."
ack stupid
vi -S
git add v_scripts/calibrate_camera.py 
git ci -m "Added option to load features from pkl."
git ci -m "Fixed pattern sizes flip for single file, removed individual pkl save."
git ci -m "Troubleshooting extrinsics."
git add v_scripts/calibrate_rig.py 
git ci -m "bugfixes."
git add v_scripts/hdd_copy.py 
git ci -m "Bugfix"
git df
git add -u 
git ci -m "Fixed iframe_ix for image input."
git co 4489706
git co 04c6640
git co head
git
git co HEAD
git stash save
git stash apply @stash{1}
git st
git stash apply stash@{1]
git stash apply stash@{1}
git reset --hard
git co 0cb2a21
git co origin
git co circles
git lg
git stash list
git stash apply
git df v_suite/v_utils/cv_utils.py
fg
git st
vi -S
ll /mnt/e
fg
ipython
htop
vsui 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_roll  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_roll  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type single --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
cat pattern_sizes.txt 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
vsui 
ll calibration_extrinsic/
lll calibration_extrinsic/00x00,02x04/
cat calibration_extrinsic/00x00,02x04/
cat calibration_extrinsic/00x00,02x04/extrinsic.json 
cat calibration_extrinsic/002x05,02x04/extrinsic.json 
cat calibration_extrinsic/02x05,02x04/extrinsic.json 
cd ../Radiant_Calibration_TEST/
cat calibration_extrinsic/00x00,01x01/extrinsic.json 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Radiant_Calibration_TEST/iframes/00x00/clip000_frame240.png ~/data/in/Radiant_Calibration_TEST/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Radiant_Calibration_TEST/calibration_intrinsic/ --pattern_sizes 9:19-10:18 --rig_type multiple --ref_camera_uv 1,1 --pattern circles
ll ..
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_noclustering  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
cat ../Sony_Stage_6-26-2018/calibration_extrinsic_noclustering/00x00,02x04/extrinsic.json 
cat ../Sony_Stage_6-26-2018/calibration_extrinsic/00x00,02x04/extrinsic.json 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_clustering  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
eog&
ll /mnt/e/Sony_Stage_6-26-2018/data/00x00
lll /mnt/e
lll /mnt/e/SONY_Calibration_TEST/
lll /mnt/e/Sony_Stage_6-26-2018/
lll /mnt/e/Sony_Stage_6-26-2018/data
lll /mnt/e/Sony_Stage_6-26-2018/data/00x00
vui
cd data/in/Sony_Stage_6-26-2018/

python  -m pdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_combined  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic_combined/ --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features/
c
python  ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_combined  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic_combined/ --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features/
python -m ipdb  ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_combined  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic_combined/ --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features/
python -m ipdb  ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_combined  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features/
cp measured_features/cg_meas_roll_all.pkl .
mv measured_features/cg_meas_roll_all.pkl .
mv cg_meas_roll.pkl measured_features/
python -m ipdb  ~/Software/v_suite/v_scripts/calibrate_rig.py blah ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_combined  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features/
mv measured_features/cg_meas_roll_all.pkl measured_features/cg_meas_roll_all
python -m ipdb  ~/Software/v_suite/v_scripts/calibrate_rig.py blah ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_combined  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features/ --ref_camera_uv 2,4
mv calibration_extrinsic_test calibration_extrinsic_stillstest
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
ls calibration_extrinsic_test/
rm -r calibration_extrinsic_test/
ls calibrations_extrinsic_stillstest/
ls calibration_extrinsic_stillstest/
rm -r calibration_extrinsic_stillstest/
ls calibration_extrinsic_clustering/
lll calibration_extrinsic_clustering/
ll calibration_extrinsic_roll_all
mv calibration_extrinsic_roll_all/cg_meas.pkl measured_features/cg_meas_roll_all
rm -r calibration_extrinsic_roll_all/

chmode 775 -R Sony_Stage_6-26-2018/
chmod 775 -R Sony_Stage_6-26-2018/
sudo chmod 775 -R Sony_Stage_6-26-2018/
sudo mkdir test
sudo rm -r test
chown alex Sony_Stage_6-26-2018/
sudo chown alex Sony_Stage_6-26-2018/
cd Sony_Stage_6-26-2018/
chown alex Tetraview/
sudo chown alex Tetraview/
mkdir test
rm -r test
python -m ipdb  ~/Software/v_suite/v_scripts/calibrate_rig.py blah ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_test  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features/cg_meas_stills.pkl --ref_camera_uv 2,4
ls calibration_extrinsic
ll calibration_extrinsic
rm -r calibration_extrinsic/
mv cg_meas.pkl calibration_extrinsic/
ll /mnt
sudo umount /mnt
sudo umount /mnt/e
ls *.pkl
mv calibration_extrinsic/cg_meas.pkl .
du -hd 1
ls calibration_intrinsic/
ls calibration_intrinsic/00x00
tree calibration_intrinsic/00x00
tree calibration_intrinsic/
rm measured_features/cg_meas_stills.pkl 
mv cg_meas.pkl measured_features/cg_meas_stills.pkl
ls measured_features/
python -m ipdb  ~/Software/v_suite/v_scripts/calibrate_rig.py blah ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_test  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features/cg_meas_stills.pkl --ref_camera_uv 2,4 --obj_unit 4.67
python -m ipdb  ~/Software/v_suite/v_scripts/calibrate_rig.py blah ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_test  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features/cg_meas_stills.pkl --ref_camera_uv 2,4 --obj_unit .0467
ls calibration_extrinsic/
ls calibration_extrinsic_test
rm -r calibration_extrinsic
mv calibration_extrinsic_test calibration_extrinsic
ll measured_features/
python -m ipdb  ~/Software/v_suite/v_scripts/calibrate_rig.py blah ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_test  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features/cg_meas_roll.pkl --ref_camera_uv 2,4 --obj_unit .0467
python -m ipdb  ~/Software/v_suite/v_scripts/calibrate_rig.py blah ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_test  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/measured_features --ref_camera_uv 2,4 --obj_unit .0467
$PYTHONPATH
conda list
source bash
source ~/.bashrc
echo $PYTHONPATH
ipython 
ll depth/
ls ../../out/
ls ../../out/best_depth/
du -hd 1 in
ll in
chmod -R 775 in
sudo chmod -R 775 in
mv in/* .
jobs
cd out
ls best_depth/
mv best_depth ../fire_clip_25_frame_5386_color_corrected/
mv tika ../tika/out/
cd ../tika/
mv out py_ibr_out
ls py_ibr_out/
ls ../fire_clip_25_frame_5386_color_corrected/source_tifs/
ls ../fire_clip_25_frame_5386_color_corrected/best_respaced/
cd ../unreal_2048_2048_7_7_nominal/
mkdir unreal_room
mv unreal_2048_2048_7_7_nominal unreal_room/
cd unreal_room/
cd unreal_2048_2048_7_7_nominal/
mv depth frames out* ../
mv frames* ..
mv unreal_room_1024_1024_7_7_depth_est_localexp_depth_est.npz .
mv unreal_room_1024_1024_7_7_depth_est_localexp_depth_est.npz ..
ls | wc
ls frames/
cat frames/
cat frames256,256,90_30.0,30.0,100.0_0.0000,0.5000,0.0000.txt 
mv frames* frames/
ls depth/
mv ../in/* ../
mv Sony_Stage_6-26-2018 2018-06-26_sony
ls out/
rm -r out
ls local_exp/
rm -r in
ls 25_5386_raw/
ls 25_5386_raw/out_lf_x/
mv calibration_051418 2018-05-14_sony
mv Radiant_Calibration_TEST 2018-06-18_radiant
ls shoot5/
ls nicole_test/
lll nicole_test/
mv fire_clip_25_frame_5386_color_corrected/Raster_imgs.png tika/
ls tika
ls tika/
mv nicole_test/ 2018-05-14_sony/
ls 2018-05-14_sony/
ls fire_clip_25_frame_5386_color_corrected/best_mesh/
cat fire_clip_25_frame_5386_color_corrected/best_mesh/540,960,54.json 
cd fire_clip_25_frame_5386_color_corrected/
mv best_mesh/540,960,54.json ../tika/trajectory_540,960,54.json
ls ../tika/
cd ../tika/py_ibr_out/
ls ..
cd ..
mv py_ibr_out out_py_ibr
source ~/.bashrc 

python -m tika 
ls out_py_ibr/
lll out_py_ibr/
pwd
mv ../fire_clip_25_frame_5386_color_corrected/fire_clip_25_frame_5386_color_corrected.npz ../fire_clip_25_frame_5386_color_corrected/fire_clip_25_frame_5386_color_corrected_bu.npz
ls ../fire_clip_25_frame_5386_color_corrected/
cd ../fire_clip_25_frame_5386_color_corrected/
mv from_source_tifs.npz from_source_tifs_bu.npz
mv fire_respaced_x_adjust_converted.npz fire_respaced_x_adjust_converted_bu.npz
rm fire_clip_25_frame_5386_color_corrected_bu.npz 
ls
run -m run_ibr
ls best_respaced/
ll
python -m run_ibr
rm fire_respaced_x_adjust_converted.npz 
lll from*
rm from_source_tifs.npz 
lll
python -m tika
python -m ipdb ~/Software/py_ibr/py_ibr/run_ibr.py 
vi Software/py_ibr/configs/paris_config.ini 
vi Software/py_ibr/configs/paris_config.ini 
cd .vim_runtime/
tree
ls
vi -S
ack g:ale_fixers
rm -r sources_non_forked/bufexplorer
ls forked_disabled/
ls non_forked_disabled/
rm -r forked_disabled/
rm -r sources_non_forked/comfortable-motion.vim/
vi my_configs.vim 
ls sources_non_forked/
mv sources_non_forked/auto-pairs/ non_forked_disabled/
wget ps://gist.github.com/xen/6334976.js"></script>
wget https://gist.githubusercontent.com/xen/6334976/raw/7e3061b395a2e635dcda86371c1414ce0c7c35bc/.pylintrc
curl https://gist.githubusercontent.com/xen/6334976/raw/7e3061b395a2e635dcda86371c1414ce0c7c35bc/.pylintrc -o ~/.pylintrc_xen
lll ~/
la -lrt ~/
vi ~/.pylintrc 
rm ~/.pylintrc_xen 
ffg
cd Software/v_suite/v_scripts/
cd ../v_suite/
ls v_outputs/
vi v_outputs/out_matrix.py 
l
ack Image
git df v_scripts/calibrate_all_cameras.py
git add v_scripts/calibrate_all_cameras.py 
git ci -m "Working with Radiant data."
addkey 
git fetch origin
git checkout -b feat/gcnet origin/feat/gcnet 
git merge master
vi v_suite/v_apis/cv_api.py 
vi v_suite/v_preprocessors/pre_resize_views.py 
git df v_scripts/hdd_copy.py
git df v_suite/v_utils/cv_utils.py
git add v_suite/v_apis/cv_api.py 
git add v_suite/v_preprocessors/pre_resize_views.py 
git stash
git co feat/gcnet 
git co circles 
rm ../python_scripts/pairwise_rectify_depth.py 
vi v_scripts/calibrate_rig.py 
pylint ../python_scripts/test_findCirclesgrid.py 
git ci -m "Minor fixes."
vi ~/.bashrc
vi ~/
la 
ack import
la
la .ipython/
vi .ipython/profile_default/
sudo umount /mnt/e
ll /mnt
cd data/in/Sony_Stage_6-26-2018/calibration_extrinsic/
ipython 
git add v_suite/v_apis/cv_api.py 
git add v_suite/v_preprocessors/pre_resize_views.py 
git stash
git co feat/gcnet 
git co circles 
rm ../python_scripts/pairwise_rectify_depth.py 
vi v_scripts/calibrate_rig.py 
pylint ../python_scripts/test_findCirclesgrid.py 
git ci -m "Minor fixes."
vi ~/.bashrc
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.m blah --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/calibration_extrinsic/cg_meas_roll.pkl  --out_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic 
python ~/Software/v_suite/v_scripts/calibrate_camera.py blah --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/calibration_extrinsic/cg_meas_roll.pkl  --out_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic 
python -m calibrate_camera /media/alex/data/in/Radiant_Calibration_TEST/iframes/00x00/ --pattern circles --pattern_sizes 19:9-18:10  --rig_type multiple  --out_dir ./intr_test_00x00/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py /media/alex/data/in/Radiant_Calibration_TEST/iframes/00x00/ --pattern circles --pattern_sizes 19:9-18:10  --rig_type multiple  --out_dir ./intr_test_00x00/
cd data/in/Sony_Stage_6-26-2018/
cat calibration_intrinsic/intrinsic.json 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py blah --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/calibration_extrinsic/cg_meas_roll.pkl  --out_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py /media/alex/data/in/Radiant_Calibration_TEST/iframes/00x00/ --pattern circles --pattern_sizes 19:9-18:10  --rig_type multiple  --out_dir /media/alex/data/in/Radiant_Calibration_TEST/intr_test_00x00/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py blah --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/calibration_extrinsic/cg_meas_stills.pkl  --out_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic 
rm -r calibration_intrinsic/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py blah --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/calibration_extrinsic/cg_meas_stills.pkl  --out_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic --save_images
ls calibration_intrinsic/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py /00x00 --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/calibration_extrinsic/cg_meas_stills.pkl  --out_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/00x00
lll calibration_intrinsic/
lll calibration_intrinsic/00x00/
cat calibration_intrinsic/00x00/
cat calibration_intrinsic/00x00/intrinsic.json 
rm -r data/calibration_intrinsic/
python -m calibrate_all_cameras
ll calibration_intrinsic/
rm -r calibration_intrinsic/calib_images
cd calibration_intrinsic/
rm -r undistort_images/
rm intrinsic.json 
rm meta.json 
ll calibration_extrinsic/
rm -r calibration_extrinsic/*
ipython 
cd data/in/Sony_Stage_6-26-2018/
ls iframes/00x07/
rm -r iframes/
python -m extract_iframes
rm ../python_scripts/pairwise_rectify_depth.py 
vi v_scripts/calibrate_rig.py 
pylint ../python_scripts/test_findCirclesgrid.py 
git ci -m "Minor fixes."
vi ~/.bashrc
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/000.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 9:19-10:18 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
cd data/in/Sony_Stage_6-26-2018/
cd calibration_extrinsic/
cp cg_meas.pkl cg_meas_stills.pkl
mv calibration_extrinsic/cg_meas.pkl calibration_extrinsic/cg_meas_roll.pkl
ls calibration_extrinsic/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 19:9-20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file
ll
ll calibration_extrinsic/ 
mv calibration_extrinsic/cg_meas.pkl .
cat ../Radiant_Calibration_TEST/calibration_intrinsic/00x00/intrinsic.json 
vi pattern_sizes.txt 
cat calibration_intrinsic/intrinsic.json 
lll calibration_intrinsic/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --ref_camera_uv 2,5 --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/calibration_extrinsic/cg_meas_stills.pkl 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --ref_camera_uv 2,4 --measurement_pkl /media/alex/data/in/Sony_Stage_6-26-2018/calibration_extrinsic/cg_meas_stills.pkl 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/000.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 19:9-20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/000.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 20:8-19:9 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30
ll calibration_extrinsic/
cat calibration_extrinsic/02x05,02x04/extrinsic.json 
mv calibration_extrinsic/cg_meas.pkl calibration_extrinsic/cg_meas_stills.pkl
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 20:8-19:9 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file
cat pattern_sizes.txt 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
cd data/in/Sony_Stage_6-26-2018/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
cd data/in/Sony_Stage_6-26-2018/
cd data/in/Radiant_Calibration_TEST/
ls 3x3
ls 2x2
python -m hdd_copy
python -m hdd_copy ./2x2 ./data_2x2 
cat number_to_position.csv 
cp number_to_position.csv number_to_position2x2.csv 
vi number_to_position.csv 
vi number_to_position2x2.csv 
python -m hdd_copy ./2x2 ./data_2x2 --cam_mapping number_to_position2x2.csv 
cd ../Sony_Stage_6-26-2018/
kill %1
ipython 
vi 
cd Software/v_suite/
ack zoom
git pull origin master
git add v_suite/v_utils/cv_utils.py 
git ci
git ci 
git log
cd .vim_runtime/
ack comfortable_motion
ack comfortable_motion vimrc/*
ls 
ack comfortable_motion vimrcs/*
ls vimrcs/
vi vimrcs/plugins_config.vim 
ack g:ale_fixers
rm -r sources_non_forked/bufexplorer
ls forked_disabled/
ls non_forked_disabled/
rm -r forked_disabled/
rm -r sources_non_forked/comfortable-motion.vim/
vi my_configs.vim 
ls sources_non_forked/
mv sources_non_forked/auto-pairs/ non_forked_disabled/
wget ps://gist.github.com/xen/6334976.js"></script>
wget https://gist.githubusercontent.com/xen/6334976/raw/7e3061b395a2e635dcda86371c1414ce0c7c35bc/.pylintrc
curl https://gist.githubusercontent.com/xen/6334976/raw/7e3061b395a2e635dcda86371c1414ce0c7c35bc/.pylintrc -o ~/.pylintrc_xen
lll ~/
la -lrt ~/
vi ~/.pylintrc 
rm ~/.pylintrc_xen 
ffg
cd Software/v_suite/v_scripts/
cd ../v_suite/
ls v_outputs/
vi v_outputs/out_matrix.py 
l
ack Image
git df v_scripts/calibrate_all_cameras.py
git add v_scripts/calibrate_all_cameras.py 
git ci -m "Working with Radiant data."
addkey 
git fetch origin
git checkout -b feat/gcnet origin/feat/gcnet 
git merge master
vi v_suite/v_apis/cv_api.py 
vi v_suite/v_preprocessors/pre_resize_views.py 
git df v_scripts/hdd_copy.py
git add v_suite/v_apis/cv_api.py 
git add v_suite/v_preprocessors/pre_resize_views.py 
git co feat/gcnet 
rm ../python_scripts/pairwise_rectify_depth.py 
pylint ../python_scripts/test_findCirclesgrid.py 
git ci -m "Minor fixes."
vi ~/.bashrc
cd Software/v_suite/
vi v_scripts/calibrate_rig.py 
git stash
git co feat/extract_points 
vi v_scripts/extrinsics_pair.py 
git co circles 
git ci -m "Working feature extraction for stills."
git df v_scripts/calibrate_rig.py
git df v_suite/v_utils/file_utils.py
git add v_suite/v_utils/file_utils.py 
git ci "bug fix."
git ci -m "bug fix."
git ci -m "Single file, single pattern working."
ack stupid
git add v_scripts/calibrate_camera.py 
git ci -m "Added option to load features from pkl."
git ci -m "Fixed pattern sizes flip for single file, removed individual pkl save."
git ci -m "Troubleshooting extrinsics."
git add v_scripts/calibrate_rig.py 
git ci -m "bugfixes."
git add v_scripts/hdd_copy.py 
git ci -m "Bugfix"
git ci -m "Fixed iframe_ix for image input."
git co 4489706
git co 04c6640
git co head
git co HEAD
git stash apply @stash{1}
git stash apply stash@{1]
git stash apply stash@{1}
git co 0cb2a21
git co origin
git co circles
git stash list
git df v_suite/v_utils/cv_utils.py
ll /mnt
ll /mnt/e
cd data/in/Sony_Stage_6-26-2018/
ipython 
ipython
htop
vsui 
cd data/in/Sony_Stage_6-26-2018/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_roll  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_roll  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type single --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
cat pattern_sizes.txt 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
vsui 
cd data/in/Sony_Stage_6-26-2018/
ll calibration_extrinsic/
lll calibration_extrinsic/00x00,02x04/
cat calibration_extrinsic/00x00,02x04/
cat calibration_extrinsic/00x00,02x04/extrinsic.json 
cat calibration_extrinsic/002x05,02x04/extrinsic.json 
cat calibration_extrinsic/02x05,02x04/extrinsic.json 
cd ../Radiant_Calibration_TEST/
cat calibration_extrinsic/00x00,01x01/extrinsic.json 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Radiant_Calibration_TEST/iframes/00x00/clip000_frame240.png ~/data/in/Radiant_Calibration_TEST/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Radiant_Calibration_TEST/calibration_intrinsic/ --pattern_sizes 9:19-10:18 --rig_type multiple --ref_camera_uv 1,1 --pattern circles
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
ll ..
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_noclustering  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
cat ../Sony_Stage_6-26-2018/calibration_extrinsic_noclustering/00x00,02x04/extrinsic.json 
cat ../Sony_Stage_6-26-2018/calibration_extrinsic/00x00,02x04/extrinsic.json 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_clustering  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
eog&
cd Software/py-ibr2/
vi tika_configuration.py 
git -b create testing
git co -b testing
mkdir tests
vi tests/test_ibr.py
python tests/test_ibr.py 
vsuifg
mkdir ../python_scripts/ibr
mv convert_npz.py mesh_alignment.py rename_lf_files.py tika_movie.py undistort_script.py ../python_scripts/ibr/
ll ../python_scripts/ibr
mkdir py-ibr2
rm -r __pycache__
mv ./* py-ibr2/
rm py-ibr2/Session.vim 
mv py-ibr2/README.md .
mv py-ibr2/requirements.txt .
ack gap_fill
ack fill
cp ../v_suite/.gitignore .
cp ../v_suite/v_suite/__init__.py  ./py-ibr2/
cat py-ibr2/__init__.py 
git add py-ibr2/
git add .gitignore 
mv py_ibr/py-ibr2 py_ibr/py_ibr
vi blob_detection.py 
ls python_scripts/blob*
mv blob_detection.py python_scripts/
vi undistort_rectify_single.py 
ls python_scripts/
diff undistort_rectify_single.py python_scripts/pairwise_rectify.py 
mv undistort_rectify_single.py python_scripts/
cd py-ibr2/
mv py_ibr py-ibr2
ls py-ibr2/
cp py-ibr2/camera_model.py 
cp py-ibr2/camera_model.py  .
rm camera_model.py 
mv py-ibr2 py_ibr
vi README.md 
cat requirements.txt 
git add py_ibr/
git ci -m "Turned into module. Renamed to avoid forbidden "-"."
git co config 
LS
git co config
vi tika_backup.py 
ls *.ini
vi ~/.bashrc 
vi paris_ibr.py 
git branch -d vectorized
git push origin --delete vectorized
vi py_ibr/paris_ibr.py 
rm py_ibr/camera_model_.py 
cd py_ibr/
vi depth_constant.py 
vi light_field.py 
charm paris_ibr.py 
lll
ack pixel_point
ack generate_ray_directions
ack compute_rays
ack overwrite
vi tika_for_vvf.py 
rm tika_for_vvf
rm tika_for_vvf.py 
rm tika_paren_conf.py 
rm tika_paren_depthmap.py 
rm tika_paren.py 
cat readme.txt 
rm readme.txt 
rm depth_constant.py 
git ci -m "Removing unused files/functions."
vi gap_fill.py 
git co fix/dm_bugs 
ls ..
lll ..
rm tika_config.ini 
ack create_output_camera
ack blank_image
ack image_xy
cd ..
mkdir configs
mv py_ibr/paris_config.ini configs
rm py_ibr/paris_config_.ini 
ack if not os.path.exists
git add configs/
mv py_ibr/render_novel_views.py py_ibr/run_ibr.py
git ci -m "Reorganized Renderer, run_ibr script working with Paris dat."
git ci --amend 
ack load_from_npz
mv py_ibr/Session.vim .
git ci -m "Testing create_npz."
addkey
git reset --hard
git pull
git df tika_configuration.py testing/py_ibr/tika_configuration.py
git df tika_configuration.py testing/tika_configuration.py
git ci -m "Troubleshooting create_npz."
git co testing 
git ci -m "Switched to row major rig."
git co master
vi tika.py 
git co testing
git df py_ibr/paris_configuration.py
git df py_ibr/tika_configuration.py
git add py_ibr/paris_configuration.py 
git add py_ibr/tika_configuration.py 
git add -u
git ci -m "Added ability to load mesh from constructor."
ack spacing
git add -u 
git ci --amend
ls py_ibr/
ls
rm Session.vim 
rm py_ibr/Session.vim 
git
git stash save
git stash apply
git add configs/*
git add py_ibr/light_field.py 
git add py_ibr/run_ibr.py 
git df
git add py_ibr/renderer.py 
git ci -m "Reorganized renderer init."
vi -S
tree
rm -r __pycache__/
rm -r py_ibr/__pycache__/
vi py_ibr/__init__.py 
rum -r py_ibr/tests/__pycache__/
rm -r -r py_ibr/tests/__pycache__/
vi py_ibr/run_ibr.py 
git st
git lg
nosetest
vsui
nosetests
python -m run_ibr
fg
cd .vim_runtime/
ack comfortable_motion
ack comfortable_motion vimrc/*
ls 
ack comfortable_motion vimrcs/*
ls vimrcs/
vi vimrcs/plugins_config.vim 
ack g:ale_fixers
rm -r sources_non_forked/bufexplorer
ls forked_disabled/
ls non_forked_disabled/
rm -r forked_disabled/
rm -r sources_non_forked/comfortable-motion.vim/
rm Session.vim 
vi my_configs.vim 
ls sources_non_forked/
mv sources_non_forked/auto-pairs/ non_forked_disabled/
wget ps://gist.github.com/xen/6334976.js"></script>
wget https://gist.githubusercontent.com/xen/6334976/raw/7e3061b395a2e635dcda86371c1414ce0c7c35bc/.pylintrc
curl https://gist.githubusercontent.com/xen/6334976/raw/7e3061b395a2e635dcda86371c1414ce0c7c35bc/.pylintrc -o ~/.pylintrc_xen
lll ~/
la -lrt ~/
vi ~/.pylintrc 
rm ~/.pylintrc_xen 
ffg
cd Software/v_suite/v_scripts/
cd ../v_suite/
ls v_outputs/
vi v_outputs/out_matrix.py 
l
ack Image
cd ..
git ci -m "Working with Radiant data."
addkey 
git fetch origin
git checkout -b feat/gcnet origin/feat/gcnet 
git merge master
vi v_suite/v_apis/cv_api.py 
vi v_suite/v_preprocessors/pre_resize_views.py 
git df v_scripts/hdd_copy.py
git add v_suite/v_apis/cv_api.py 
git add v_suite/v_preprocessors/pre_resize_views.py 
git co feat/gcnet 
rm ../python_scripts/pairwise_rectify_depth.py 
pylint ../python_scripts/test_findCirclesgrid.py 
git ci -m "Minor fixes."
vi ~/.bashrc
git stash
git co feat/extract_points 
vi v_scripts/extrinsics_pair.py 
git ci -m "Working feature extraction for stills."
git df v_scripts/calibrate_rig.py
git df v_suite/v_utils/file_utils.py
git add v_suite/v_utils/file_utils.py 
git ci "bug fix."
git ci -m "bug fix."
git ci -m "Single file, single pattern working."
ack stupid
git ci -m "Added option to load features from pkl."
git ci -m "Fixed pattern sizes flip for single file, removed individual pkl save."
git ci -m "Troubleshooting extrinsics."
git ci -m "bugfixes."
git add v_scripts/hdd_copy.py 
git ci -m "Bugfix"
git ci -m "Fixed iframe_ix for image input."
git co 4489706
git co 04c6640
git co head
git
git co HEAD
git stash apply @stash{1}
git stash apply stash@{1]
git stash apply stash@{1}
git co 0cb2a21
git co origin
ll /mnt
ll /mnt/e
vsui
cd data/in/Sony_Stage_6-26-2018/
ipython 
ipython
htop
vsui 
cd data/in/Sony_Stage_6-26-2018/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_roll  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_roll  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type single --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
cat pattern_sizes.txt 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/data/00x00/023.MP4 ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_size 20:8 --rig_type multiple --ref_camera_uv 2,4 --pattern circles --rotate_deg -90 --iframe_every 30 --single_file --min_cluster_size 5
vsui 
cd data/in/Sony_Stage_6-26-2018/
ll calibration_extrinsic/
lll calibration_extrinsic/00x00,02x04/
cat calibration_extrinsic/00x00,02x04/
cat calibration_extrinsic/00x00,02x04/extrinsic.json 
cat calibration_extrinsic/002x05,02x04/extrinsic.json 
cat calibration_extrinsic/02x05,02x04/extrinsic.json 
cd ../Radiant_Calibration_TEST/
cat calibration_extrinsic/00x00,01x01/extrinsic.json 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Radiant_Calibration_TEST/iframes/00x00/clip000_frame240.png ~/data/in/Radiant_Calibration_TEST/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Radiant_Calibration_TEST/calibration_intrinsic/ --pattern_sizes 9:19-10:18 --rig_type multiple --ref_camera_uv 1,1 --pattern circles
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
ll ..
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_noclustering  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
cat ../Sony_Stage_6-26-2018/calibration_extrinsic_noclustering/00x00,02x04/extrinsic.json 
cat ../Sony_Stage_6-26-2018/calibration_extrinsic/00x00,02x04/extrinsic.json 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /media/alex/data/in/Sony_Stage_6-26-2018/iframes/00x00/clip000_frame870.png ~/data/in/Sony_Stage_6-26-2018/calibration_extrinsic_clustering  --intrinsics_dir /media/alex/data/in/Sony_Stage_6-26-2018/calibration_intrinsic/ --pattern_sizes 8:20-9:19 --rig_type multiple --ref_camera_uv 2,4 --pattern circles
eog&
cd Software/v_suite/
git df v_suite/v_utils/cv_utils.py
git add v_scripts/calibrate_all_cameras.py 
git add v_scripts/calibrate_camera.py 
git add v_suite/v_utils/cv_utils.py 
git ci -m "Intrinsics from multiple feature files."
git df v_scripts/calibrate_all_cameras.py
git add -u 
git ci -m "Extrinsics from multiple feature files."
ack calc_extrinsics
ack :class:`float
ack :class:`float`
vi v_suite/v_outputs/out_extrinsics.py 
git ci -m "Added obj_unit parameter in calc_extrinsic."
git df v_suite/v_outputs/out_extrinsics.py
git add v_suite/v_outputs/out_extrinsics.py 
git add v_scripts/calibrate_rig.py 
git ci -m "Assumed ultiple patterns are stable at same times."
addkey
git push
ack test
ls v_suite/v_experiments/
ls v_suite/v_experiments/domains/
ls v_suite/v_experiments/domains/unreal_room/
ls v_suite/v_experiments/domains/unreal_room/config/
ack local_expt
ack local_exp
ack local
ack localexp
ls v_suite/v_tests/
vi v_suite/v_tests/
tree
nosetests
cat requirements.in 
cat setup.py 
ls .gitignore 
cat  .gitignore 
ls v_suite/
cat v_suite/__init__.py 
vi v_suite/__init__.py 
vi .gitignore 
vi .git/
la
ack configObj
ack configobj
vi v_suite/v_utils/cv_utils.py 
vi v_suite/v_preprocessors/pre_render_novel_views.py 
mv v_scripts/calibrate_all_cameras.py ..
git co circles 
ls v_scripts/
diff v_scripts/calibrate_all_cameras.py ../calibrate_all_cameras.py 
vi ../calibrate_all_cameras.py 
rm ../calibrate_all_cameras.py 
git stash apply
git stash list
ack Except
git stash save
ls
vi v_scripts/calibrate_rig.py 
git co circles
git df 
git reset --hard
ls v_suite/v_preprocessors/
git df v_suite/v_preprocessors/pre_estimate_extrinsics_pairwise_views.py
rm v_suite/v_preprocessors/pre_estimate_extrinsics_pairwise.py 
git df
git pull
vi v_suite/v_preprocessors/pre_estimate_extrinsics_pairwise_views.py 
git g
fg
git st
git add -u
git ci --amend
git lg
git co master
vi -S
cd .vim/
cd ../.vim_runtime/
vi -S
cd Software/py_ibr/
vi -S
fg
git lg
vi -S
cd .vim/
cd ../.vim_runtime/
vi -S
cd Software/py_ibr/
vi -S
cd Software/v_suite/
ack parse
vi v_suite/cobj_factory.py 
ack type_coerce
git co circles 
git st
git co master
git co circles
fg
vsui
cd data
ipython 
ipython
ipython 
ipython
cd Software/
cd notebooks/
addkey
git pull
vi prototype/depth/shoot_00006_results.ipynb 
jupyter prototype/depth/shoot_00006_results.ipynb 
ipython prototype/depth/shoot_00006_results.ipynb 
jupyter notebook
cd ../v_suite/
git st
git df
git reset --hard
git lg
ls
vi v_scripts/calibrate_all_cameras.py 
cat data/2018-06-26_sony/calibration_intrinsic_nok3/02x00/intrinsic.json 
cat data/2018-06-26_sony/calibration_intrinsic/02x00/intrinsic.json 
cp ~/winhome/Downloads/TSDF_fusion.py.txt ~/Software/python_scripts/TSDF_fusion.py
vi Software/python_scripts/TSDF_fusion.py 
cd Software/notebooks/
git st
git reset --hard
vi ~/Software/python_scripts/point_cloud_alignment.py
jupyter notebook
cp ~/winhome/Downloads/shoot_00006_results.py ~/Software/python_scripts/
fg
cd Software/v_suite/
vi -S
vi -S
cd .vim/
cd ../.vim_runtime/
vi -S
cd Software/py_ibr/
vi -S
cd Software/v_suite/
ack parse
vi v_suite/cobj_factory.py 
ack type_coerce
git co circles 
git st
git co master
git co circles
fg
cd data
ipython
vsui
cd data/2018-06-26_sony/
ls
tree calibration_extrinsic/
tree calibration_intrinsic/
ls measured_features/
ll measured_features/
mv measured_features/cg_meas_roll_all measured_features/cg_meas_roll_all.pkl
mv measured_features/ measured_features_extr
mkdir measured_features_intr
mv measured_features_extr/cg_meas_roll_all.pkl measured_features_intr/
ln -s measured_features_intr/cg_meas_stills.pkl measured_features_extr/cg_meas_stills.pkl 
ln -s measured_features_extr/cg_meas_stills.pkl measured_features_intr/cg_meas_stills.pkl 

python -m  ipdb calibrate_all_cameras
python -
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py  blah --out_dir ./calibration_intrinsic_combined --measurement_pkl ./measured_features_intr 
ls calibration_extrinsic
ls calibration_extrinsic*
rm measured_features_extr/
mv measured_features_extr/cg_meas_roll.pkl measured_features_intr/cg_meas_stills.pkl 
ll measured_features_intr/
ls measured_features_extr/
ll measured_features_extr/
rm measured_features_intr/cg_meas_stills.pkl 
cp measured_features_extr/cg_meas_stills.pkl measured_features_intr/
ls measured_features_intr/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py  ./data/00x00 --out_dir ./calibration_intrinsic_combined --measurement_pkl ./measured_features_intr 
rm -r calibration_intrinsic_combined/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py  ./data/00x00 --out_dir ./calibration_intrinsic_combined --measurement_pkl ./measured_features_intr --save_images
ls 
ll calibration_intrinsic_combined/
rm calibration_intrinsic_combined/*
rm -r calibration_intrinsic_combined/*
python -m calibrate_all_cameras
ipython 
vi v_scripts/calibrate_all_cameras.py 
vsui
cd data/2018-06-26_sony/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py ./00x00 --measurement_pkl ./measured_features_intr  --out_dir ./calibration_intrinsic_nok3/02x00/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_camera.py ./00x00 --measurement_pkl ./measured_features_intr  --out_dir ./calibration_intrinsic_nok3/02x00/ --model two_radial --save_images
cat calibration_intrinsic/02x00/intrinsic.json | tail
cat calibration_intrinsic_nok3/02x00/intrinsic.json 
rm -r calibration_intrinsic_nok3/
python -m calibrate_all_cameras
lll calibration_intrinsic*
lll calibration_intrinsic_tworadialfull/
vsui
python -m run_flow
python -m run_flow ~/Software/v_suite/v_suite/v_experiments/domains/nicole/config/colorspace_convert.ini 
ls data/tests/
ls data/tests/colorspace_convert/
ls data/tests/colorspace_convert/000/
ipython 
eog&
cd data/
ls
vi 2018-07-19_sony_notes.txt
jobs
kill %1
kill %2
fg
ipython 
ipython
ipython 
ipython
cd Software/
cd notebooks/
vi prototype/depth/shoot_00006_results.ipynb 
jupyter prototype/depth/shoot_00006_results.ipynb 
ipython prototype/depth/shoot_00006_results.ipynb 
vi v_scripts/calibrate_all_cameras.py 
cat data/2018-06-26_sony/calibration_intrinsic_nok3/02x00/intrinsic.json 
cat data/2018-06-26_sony/calibration_intrinsic/02x00/intrinsic.json 
cp ~/winhome/Downloads/TSDF_fusion.py.txt ~/Software/python_scripts/TSDF_fusion.py
vi Software/python_scripts/TSDF_fusion.py 
vi ~/Software/python_scripts/point_cloud_alignment.py
cp ~/winhome/Downloads/shoot_00006_results.py ~/Software/python_scripts/
cd Software/notebooks/
addkey
sudo ls
cp ~/winhome/Downloads/shoot_00006_results\ \(1\).py ~/Software/python_scripts/shoot_00006_results.py 
git reset --hard
git pull
jupyter notebook
cp ~/winhome/Downloads/shoot_00006_results\ \(2\).py ~/Software/python_scripts/shoot_00006_results.py 
cd ../v_suite/
git add -u 
git df
git ci -m "New distortion model with k3 fixed at 0."
git lg
vi v_suite/v_experiments/domains/fire/config/fire_disparity_masked.ini 
mkdir v_suite/v_experiments/domains/nicole/
mkdir v_suite/v_experiments/domains/nicole/config
vi -S
git st
vi v_scripts/hdd_copy.py 
ls ../python_scripts/
ls
ls ../python_scripts/rig_slant.py 
rm ../python_scripts/rig_slant.py 
cp ~/winhome/Downloads/rig_slant.txt ../python_scripts/rig_slant.py
cat ../python_scripts/rig_slant.py 
vi ../python_scripts/rig_slant.py 
cp ~/winhome/Downloads/rig_slant.txt ../python_scripts/temp.py
rm ../python_scripts/temp.py 
fg
rm ../calibrate_all_cameras.py 
git stash apply
git stash list
ack Except
git stash save
vi v_scripts/calibrate_rig.py 
git co circles
git df 
git reset --hard
ls v_suite/v_preprocessors/
git df v_suite/v_preprocessors/pre_estimate_extrinsics_pairwise_views.py
rm v_suite/v_preprocessors/pre_estimate_extrinsics_pairwise.py 
git df
git pull
vi v_suite/v_preprocessors/pre_estimate_extrinsics_pairwise_views.py 
git g
fg
git st
git add -u
git ci --amend
git lg
git co master
vi -S
cd .vim/
cd ../.vim_runtime/
vi -S
vsui
cd data/2018-06-26_sony/
lll out_py_ibr/
cp out_py_ibr/renderer-540,960_40.0,66.0_0.0,0.0,0.0_0.0,-0.0,0.0.png ~/Downloads/
cp out_py_ibr/renderer-540,960_40.0,66.0_0.0,0.0,0.0_0.0,-0.0,0.0.png ~/winhome/Downloads/
cd out_py_ibr/
rm camera*
cp ~/winhome/Downloads/python_tsdf_to_mesh_23_3\ \(1\).obj  frame_tests/660/mesh/python_tsdf_to_mesh_23.obj 
lll frame_tests/660/mesh
rm frame_tests/660/mesh/python_tsdf_to_mesh_23.obj 
cp ~/winhome/Downloads/python_tsdf_to_mesh_23_3.obj  frame_tests/660/mesh/
cp ~/winhome/Downloads/python_tsdf_to_mesh_23_tsdf_fusion.obj  frame_tests/660/mesh/
ls rm -r calibration_extrinsic_c*
ls rm -r calibration_extrinsic_n*
rm -r calibration_extrinsic_roll/
rm -r calibration_extrinsic_test/
ls frame_tests/660/
ls frame_tests/660/raster/
cp ~/winhome/Downloads/rectifications-20180718T161305Z-001.zip .
unzip rectifications-20180718T161305Z-001.zip 
rm rectifications-20180718T161305Z-001.zip 
ls rectifications/
ls calibration_intrinsic
ls measured_features_intr/
ll measured_features_intr/
du -hd 1
lll ~/winhome/Downloads/
ls frame_tests/660/mesh/
mv ~/winhome/Downloads/python_tsdf_to_mesh_23_3.xyz ./frame_tests/660/mesh/
ipython 
cp ~/winhome/Downloads/python_tsdf_to_mesh_23_4.obj ./frame_tests/660/mesh/
cp ~/winhome/Downloads/calibration_extrinsic_slant-20180718T221544Z-001.zip .
unzip calibration_extrinsic_slant-20180718T221544Z-001.zip .
unzip calibration_extrinsic_slant-20180718T221544Z-001.zip 
rm calibration_extrinsic_slant-20180718T221544Z-001.zip 
mv ~/winhome/Downloads/calibration_extrinsic-20180718T231255Z-001.zip
lll ~/winhome/Downloads/calibration_extrinsic-20180718T231255Z-001.zip
ls calibration_extrinsic/
ls *.zip
rm -r calibration_extrinsic
cp ~/winhome/Downloads/calibration_extrinsic-20180718T231255Z-001.zip .
unzip calibration_extrinsic-20180718T231255Z-001.zip 
rm calibration_extrinsic-20180718T231255Z-001.zip 
cat calibration_extrinsic/02x00/
cat calibration_extrinsic/02x00,02x04/
cat calibration_extrinsic/02x00,02x04/extrinsic.json 
cat calibration_extrinsic/_slant/02x00,02x04/extrinsic.json 
cat calibration_extrinsic_slant/02x00,02x04/extrinsic.json 
python -m hdd_copy
python -m hdd_copy /mnt/d/Footage/ /mnt/d/ --cam_mapping /media/alex/data/2018-05-14_sony/number_to_position.csv 
chmod -R 775 /mnt/d/data/
sudo chmod -R 775 /mnt/d/data/
ll /mnt/d
ll /mnt/d/data/
cd /mnt/d/
chown alex data
sudo chown alex data
ll ~
sudo chown alex:alex data
du -hd 0
ll /mnt
mountwsl e
python -m ipdb ~/Software/v_suite/v_scripts/hdd_copy.py /mnt/d/Footage/ /mnt/d/ --cam_mapping /media/alex/data/2018-05-14_sony/number_to_position.csv 
ls
cd 2018-07-20_sony/
sudo chown alex:alex /mnt/d/2018-07-20_sony
sudo python -m ipdb ~/Software/v_suite/v_scripts/hdd_copy.py /mnt/d/2018-07-20_sony/Footage/ /mnt/d/2018-07-20_sony/ --cam_mapping /media/alex/data/2018-05-14_sony/number_to_position.csv --dry_run
sudo python ~/Software/v_suite/v_scripts/hdd_copy.py /mnt/d/2018-07-20_sony/Footage/ /mnt/d/2018-07-20_sony/ --cam_mapping /media/alex/data/2018-05-14_sony/number_to_position.csv --dry_run
su
cd ..
ll
python -m ipdb ~/Software/v_suite/v_scripts/hdd_copy.py /mnt/d/2018-07-20_sony/Footage/ /mnt/d/2018-07-20_sony/ --cam_mapping /media/alex/data/2018-05-14_sony/number_to_position.csv 
vi ~/data/2018-07-19_sony_notes.txt 
lll /mnt/e/2018-07-20_sony/
lll /mnt/e/2018-07-20_sony/Footage/
lll /mnt/e/2018-07-20_sony/Footage/01
lll /mnt/e/2018-07-20_sony/Footage/02
du -hd 0 /mnt/e/2018-07-20_sony/
ls data/tests/
ls data/tests/colorspace_convert/
ls data/tests/colorspace_convert/000/
ipython 
eog &
mountwsl d
ll /mnt
cd /mnt/d
cd 2018-07-20_sony/
cp Footage ./
cp -r Footage ./
rm -r data
cp -r Footage ./data
ls
rsync -Cavz /mnt/d/2018-07-20_sony/Footage/ /mnt/d/2018-07-20_sony/data/
cd ../..
ll
umount /mnt/d
sudo umount /mnt/d
ls data/tests/colorspace_convert/
ls data/tests/colorspace_convert/000/
vsui
cd data/2018-06-26_sony/
ipython 
nosetests
nosetests ~/Software/py_ibr/
fg
rm 
cd /mnt/e
ls
du -hd 2018-07-20_sony/
du -hd 0 2018-07-20_sony/
rm -r 2018-06-26_sony/
git co circles
git df 
git reset --hard
ls v_suite/v_preprocessors/
git df v_suite/v_preprocessors/pre_estimate_extrinsics_pairwise_views.py
rm v_suite/v_preprocessors/pre_estimate_extrinsics_pairwise.py 
git df
git pull
vi v_suite/v_preprocessors/pre_estimate_extrinsics_pairwise_views.py 
git g
git st
git add -u
git ci --amend
git lg
git co master
vi -S
cd .vim/
cd ../.vim_runtime/
vi -S
cd data/2018-06-26_sony/
vsui
python -m run_ibr
la ~
rm ~/Downloads/*
la ~/Downloads/
cd /mnt/d/Footage/
ls 01
du -hd 1
cd /mnt
fg
sudo umount /mnt/d
sudo umount /mnt/e
mountwst d
ipython 
mountwsl d
ll /mnt
cd d
python -m hdd_copy /mnt/d/2018-07-20_sony/Footage\ -\ Copy/ /mnt/d/2018-07-20_sony/ ~/data/2018-05-14_sony/number_to_position.csv --dry_run
python -m hdd_copy /mnt/d/2018-07-20_sony/Footage\ -\ Copy/ /mnt/d/2018-07-20_sony/ --cam_mapping ~/data/2018-05-14_sony/number_to_position.csv --dry_run
python -m hdd_copy /mnt/d/2018-07-20_sony/Footage\ -\ Copy/ /mnt/d/2018-07-20_sony/ --cam_mapping ~/data/2018-05-14_sony/number_to_position.csv --nocopy --dry_run
python -m hdd_copy /mnt/d/2018-07-20_sony/Footage\ -\ Copy/ /mnt/d/2018-07-20_sony/ --cam_mapping ~/data/2018-05-14_sony/number_to_position.csv --no_copy --dry_run
python -m ipdb ~/Software/v_suite/v_scripts/hdd_copy.py /mnt/d/2018-07-20_sony/Footage\ -\ Copy/ /mnt/d/2018-07-20_sony/ --cam_mapping ~/data/2018-05-14_sony/number_to_position.csv --no_copy
rm test.json 
rm -r blah
ll Footage\ -\ Copy/
ll data
tree data
tree Footage\ -\ Copy/
ls metadata/
cat metadata/camera_clip_path.json 
du -hd 0 Footage\ -\ Copy/
cd ~/data/
mkdir 2018-07-20_sony
mv camera2,4_clip02_frame5160.png 2018-05-14_sony/
mv pattern_sizes.txt 2018-07-19_sony_notes.txt 2018-07-20_sony/
cd 2018-07-20_sony/
ls ..
mv ../2018-05-14_sony/camera2,4_clip02_frame5160.png .
cat pattern_sizes.txt 
cd /mnt/d/2018-07-20_sony/data
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /mnt/d/2018-07-20_sony/data/00x00/006.MP4 /mnt/d/2018-07-20_sony/ --pattern circles --pattern_size 22:12 --iframe_every 30 --rotate_deg -90 --single_file
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /mnt/d/2018-07-20_sony/data/00x00/006.MP4 /media/alex/data/2018-07-20_sony/ --pattern circles --pattern_size 22:12 --iframe_every 30 --rotate_deg -90 --single_file
tree
cd ..
ls
ll
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /mnt/d/2018-07-20_sony/data/00x00/006.MP4 /media/alex/data/2018-07-20_sony/ --pattern circles --pattern_size 22:12 --iframe_every 30 --rotate_deg -90 --single_file --ref_camera 2,4
nosetests
nosetests ~/Software/py_ibr/
fg
rm 
cd /mnt/e
du -hd 2018-07-20_sony/
du -hd 0 2018-07-20_sony/
rm -r 2018-06-26_sony/
cd data/2018-07-20_sony/
ls measured_features_intr/
ln -s measured_features_intr/cg_meas_clip06.pkl measured_features_extr/cg_meas_clip06.pkl 
ln -s measured_features_extr/cg_meas_clip06.pkl measured_features_intr/cg_meas_clip06.pkl 
vsui
rm measured_features_intr/cg_meas_clip06.pkl 
ln measured_features_extr/cg_meas_clip06.pkl measured_features_intr/cg_meas_clip06.pkl 
ll measured_features_intr/
python -m calibrate_all_cameras 
mv calibration_intrinsic_stillsonly
mv calibration_intrinsic/ calibration_intrinsic_stillsonly 
mv calibration_intrinsic_combined calibration_intrinsic
ll measured_features_extr/
ls
tree calibration_intrinsic/
du -hd 1
cp -r Footage ./data
rsync -Cavz /mnt/d/2018-07-20_sony/Footage/ /mnt/d/2018-07-20_sony/data/
cd ../..
ll
umount /mnt/d
sudo umount /mnt/d
ls data/tests/colorspace_convert/
ls data/tests/colorspace_convert/000/
nosetests
nosetests ~/Software/py_ibr/
rm 
cd /mnt/e
du -hd 2018-07-20_sony/
du -hd 0 2018-07-20_sony/
rm -r 2018-06-26_sony/
vsui
cd data/2018-06-26_sony/
mv Camera_array.png clip029_frame1170_\(2\,4\).png clip029_frame1170_\(2\,5\).png img_ref_\(2\,\ 4\).png img_ref_remap_\(2\,\ 4\).png img_uv_\(2\,\ 5\)_\(2\,\ 4\).png img_uv_remap_\(2\,\ 3\)_\(2\,\ 4\).png  Nicole_disparity.png ref_downsampled.png RPEs.png uv_downsampled.png figures/
ls figures
mv calib_points_\(2\,0\).png  figures/
mv original-undist_\(2\,0\).png figures/
mv frames* out_py_ibr/
cd ../2018-07-20_sony/
mkdir measured_features_intr
mkdir measured_features_extr
mkdir figures
mv camera2,4_clip02_frame5160.png figures/
cat 2018-07-19_sony_notes.txt 
lll /mnt/d/2018-07-20_sony/
cp /mnt/d/2018-07-20_sony/cg_meas.pkl  ~/data/2018-07-20_sony/measured_features_intr/
mv measured_features_intr/cg_meas.pkl measured_features_intr/cg_meas_stills.pkl
python -m calibrate_all_cameras
ll 
ls
mv cg_meas.pkl measured_features_extr/cg_meas_clip06.pkl
fg
ipython 
cp -r Footage ./data
rsync -Cavz /mnt/d/2018-07-20_sony/Footage/ /mnt/d/2018-07-20_sony/data/
cd ../..
umount /mnt/d
sudo umount /mnt/d
ls data/tests/colorspace_convert/
ls data/tests/colorspace_convert/000/
cd data/2018-06-26_sony/
ipython 
nosetests
nosetests ~/Software/py_ibr/
fg
rm 
cd /mnt/e
du -hd 2018-07-20_sony/
du -hd 0 2018-07-20_sony/
rm -r 2018-06-26_sony/
vsui
cd data/2018-07-20_sony/
ls measured_features_intr/
python -m calibrate_rig /mnt
rm calibration
lll
ll calibration_extrinsic/
python -m calibrate_rig /mnt/d/2018-07-20_sony/data/00x00/000.MP4 ./calibration_extrinsic --intrinsics_dir ./calibration_intrinsic --measurement_pkl ./measured_features_extr/ 
python -m calibrate_rig /mnt/d/2018-07-20_sony/data/00x00/000.MP4 ./calibration_extrinsic --intrinsics_dir ./calibration_intrinsic_test --measurement_pkl ./measured_features_extr/ --ref_camera_uv 2,4
python -m calibrate_rig /mnt/d/2018-07-20_sony/data/00x00/000.MP4 ./calibration_extrinsic_24 --intrinsics_dir ./calibration_intrinsic --measurement_pkl ./measured_features_extr/ --ref_camera_uv 2,4
rm -r calibration_extrinsic_24/
python -m calibrate_rig /mnt/d/2018-07-20_sony/data/00x00/000.MP4 ./calibration_extrinsic_24 --intrinsics_dir ./calibration_intrinsic --measurement_pkl ./measured_features_extr/cg_meas_stills.pkl --ref_camera_uv 2,4
c
rm -r calibration_extrinsic/
mv calibration_extrinsic_24/ calibration_extrinsic
zip calibration_extrinsic
zip calibration_extrinsic calibration_extrinsic.zip
compress
zip calibration_extrinsic.zip calibration_extrinsic
mkdir test
unzip calibration_extrinsic.zip test/
ls
ls test/
rm calibration_extrinsic.zip 
zip -r calibration_extrinsic.zip calibration_extrinsic
zip -r calibration_intrinsic.zip calibration_intrinsic/
ll
fg
rm 
cd /mnt/e
du -hd 2018-07-20_sony/
du -hd 0 2018-07-20_sony/
rm -r 2018-06-26_sony/
cd /mnt/d/2018-07-20_sony/
ls metadata/
cat metadata/copy_manifest.json 
cat metadata/camera_clip_path.json 
ls ~/data/2018-05-14_sony/
vsui
python -m ipdb ~/Software/v_suite/v_scripts/hdd_copy.py ~/data/2018-06-26_sony/data/ blah --dry_run
cat ~/data/2018-05-14_sony/camera_clip_path.json 
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /mnt/d/2018-07-20_sony/data/00x00/008.MP4 /mnt/d/2018-07-20_sony/ --pattern circles --pattern_sizes 22:12-23:11 --rig_type multiple --iframe_every 30 --rotate_deg -90
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /mnt/d/2018-07-20_sony/data/00x00/008.MP4 /mnt/d/2018-07-20_sony/ --pattern circles --pattern_sizes 22:12-23:11 --rig_type multiple --iframe_every 30 --rotate_deg -90 --range_offset 2
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /mnt/d/2018-07-20_sony/data/00x00/008.MP4 /mnt/d/2018-07-20_sony/ --pattern circles --pattern_sizes 22:12-23:11 --rig_type multiple --iframe_every 30 --rotate_deg -90 --range_offset 21
ll cg_meas.pkl 
mv cg_meas.pkl cg_meas_stills.pkl
cd ~/data/2018-07-20_sony/
ls
cat calibration_intrinsic/00x00/intrinsic.json 
cat calibration_intrinsic/00x01/intrinsic.json 
cat calibration_intrinsic/00x02/intrinsic.json 
cat calibration_intrinsic/00x03/intrinsic.json 
ln measured_features_intr/cg_meas_stills.pkl measured_features_extr/cg_meas_stills.pkl
ll measured_features_extr/
ll measured_features_intr/
cat calibration_intrinsic/01x03/intrinsic.json 
ipython 
ls v_suite/v_experiments/
ls v_suite/v_experiments/domains/
ls v_suite/v_experiments/domains/unreal_room/
ls v_suite/v_experiments/domains/unreal_room/config/
ack local_expt
ack local_exp
ack local
ack localexp
ls v_suite/v_tests/
vi v_suite/v_tests/
nosetests
cat requirements.in 
cat setup.py 
ls .gitignore 
cat  .gitignore 
ls v_suite/
cat v_suite/__init__.py 
vi v_suite/__init__.py 
vi .gitignore 
vi .git/
la
ack configObj
ack configobj
vi v_suite/v_utils/cv_utils.py 
vi v_suite/v_preprocessors/pre_render_novel_views.py 
mv v_scripts/calibrate_all_cameras.py ..
git co circles 
ls v_scripts/
diff v_scripts/calibrate_all_cameras.py ../calibrate_all_cameras.py 
vi ../calibrate_all_cameras.py 
rm ../calibrate_all_cameras.py 
git stash apply
git stash list
ack Except
git stash save
vi v_scripts/calibrate_rig.py 
git co circles
git df 
ls v_suite/v_preprocessors/
git df v_suite/v_preprocessors/pre_estimate_extrinsics_pairwise_views.py
rm v_suite/v_preprocessors/pre_estimate_extrinsics_pairwise.py 
git pull
vi v_suite/v_preprocessors/pre_estimate_extrinsics_pairwise_views.py 
git g
cd .vim/
cd ../.vim_runtime/
cd Software/py_ibr/
git add configs/*
git ci -m "Moved create_rig to camera_rig."
vi tika.py 
git df tika_configuration.py
git df tika.py
rm mesh_offset 
git ci -m "Troubleshooting Nicole mesh."
git co master
git reset --hard
rm py_ibr/render_config.py 
rm py_ibr/run_ibr.py 
git co testing
ls
mv py_ibr/render_config_cobj.py py_ibr/render_config.py 
ls py_ibr/
tree
rm configs/vsuite_test.ini 
git add -u 
git ci -m "Changed config to use cobj methods."
git ci --amend
vi -SA
ack directions_to_image_xy
ack point_cloud_to_image
tree 
ls 
lll ../python_scripts/
git st
git lg
git df
git add -u
git ci -m "Troubleshooting nicole mesh."
vi -S
ack rotation_matrix_to_euler
ack point_cloud_to_depth_map
ack tait_bryan_to_matrix
ack move_camera
ack undistortPoints
fg
ack undistortPoints
fg
vsui
cd data/2018-07-20_sony/
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /mnt/d/2018-07-20_sony/data/00x00/006.MP4 ./ --pattern circles --pattern_size 22:12 --iframe_every 30 --rotate_deg -90 --single_file --ref_camera 2,4
mv cg_meas.pkl cg_meas_clip06all.pkl
python -m ipdb ~/Software/v_suite/v_scripts/calibrate_rig.py /mnt/d/2018-07-20_sony/data/00x00/007.MP4 ./ --pattern circles --pattern_size 22:12 --iframe_every 30 --rotate_deg -90 --single_file --ref_camera 2,4
ll
mv cg_meas_clip06all.pkl measured_features_intr/
ls measured_features_intr/
ack move_camera
ack undistortPoints
fg
vsui
cd data/2018-07-20_sony/
python -m calibrate_rig /mnt/d/2018-07-20_sony/data/00x00/000.MP4 ./calibration_extrinsic_leftright --intrinsics_dir ./calibration_intrinsic --measurement_pkl ./measured_features_extr/cg_meas_stills.pkl --ref_camera_uv 2,4
zip -r calibration_extrinsic_leftright.zip calibration_extrinsic_leftright
ls calibration_extrinsic_leftright | wc
python -m calibrate_rig /mnt/d/2018-07-20_sony/data/00x00/000.MP4 ./calibration_extrinsic_test --intrinsics_dir ./calibration_intrinsic --measurement_pkl ./measured_features_extr/cg_meas_clip06.pkl --ref_camera_uv 2,4
python -m calibrate_rig /mnt/d/2018-07-20_sony/data/00x00/000.MP4 ./calibration_extrinsic_test --intrinsics_dir ./calibration_intrinsic --measurement_pkl ./measured_features_extr/ --ref_camera_uv 2,4
cd ../2018-06-26_sony/
ls
zip -r nicole.zip out_py_ibr/frames
lll
lll out_py_ibr/frames/
vsui
cd data/2018-05-14_sony/
cd ../2018-07-20_sony/
ls
ls test/
rm -r test
ipython 
rm -r 2018-06-26_sony/
eog&
htop
ll /mnt
sudo umount d
sudo umount /mnt/d
cd data/2018-06-26_sony/
ls
ls data
cd ../2018-07-20_sony/
cd /
ll
mv cg_meas_clip06all.pkl measured_features_intr/
ls measured_features_intr/
ack move_camera
ack undistortPoints
fg
cd data/2018-07-20_sony/
python -m calibrate_rig /mnt/d/2018-07-20_sony/data/00x00/000.MP4 ./calibration_extrinsic_leftright --intrinsics_dir ./calibration_intrinsic --measurement_pkl ./measured_features_extr/cg_meas_stills.pkl --ref_camera_uv 2,4
zip -r calibration_extrinsic_leftright.zip calibration_extrinsic_leftright
ls calibration_extrinsic_leftright | wc
python -m calibrate_rig /mnt/d/2018-07-20_sony/data/00x00/000.MP4 ./calibration_extrinsic_test --intrinsics_dir ./calibration_intrinsic --measurement_pkl ./measured_features_extr/cg_meas_clip06.pkl --ref_camera_uv 2,4
python -m calibrate_rig /mnt/d/2018-07-20_sony/data/00x00/000.MP4 ./calibration_extrinsic_test --intrinsics_dir ./calibration_intrinsic --measurement_pkl ./measured_features_extr/ --ref_camera_uv 2,4
cd ../2018-06-26_sony/
zip -r nicole.zip out_py_ibr/frames
lll
lll out_py_ibr/frames/
cd data/2018-05-14_sony/
cd ../2018-07-20_sony/
ls test/
rm -r test
ipython 
lsb_release -a
cd Software/
vsui
addkey
git clone https://github.com/visbyio/pyfusion.git
git clone git@github.com:visbyio/pyfusion.git
cd pyfusion/
cat fusion.cpp 
cat CMakeLists.txt 
cat __init__.py 
mkdir build
make
cd ..
make .
ls ../../repos/
ls ../../repos/pyfusion/
cd ../../repos/pyfusion/
git st
ls build/
cd ../../Software/pyfusion/
ls ..
python -m setup.py
python ./setup.py 
python ./pyfusion/setup.py
ls pyfusion/
rm -r pyfusion/build/
cd ../../
cd repos/pyfusion/
ls
cd build/
cmake -version
make ..
which make
cd Software/
cp ~/winhome/Downloads/cuda_9.2.148_396.37_linux.run 
cp ~/winhome/Downloads/cuda_9.2.148_396.37_linux.run . 
ls
sudo sh cuda_9.2.148_396.37_linux.run 
$uname -r
$uname 
sagu
sagu -y
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
git df
git add -u
git ci -m "Troubleshooting nicole mesh."
vi -S
ack rotation_matrix_to_euler
ack point_cloud_to_depth_map
ack tait_bryan_to_matrix
ack move_camera
ack undistortPoints
vsui
cd data/2018-07-20_sony/
mkdir out_py_ibr
mv ~/winhome/Downloads/frame_tests-20180725T210800Z-001.zip . 
unzip frame_tests-20180725T210800Z-001.zip 
rm ./*.zip
fg
ipython 
cd out_py_ibr/
ffmpeg -r 1/5 frames/* out.mp4
lll
lll frames/
ffmpeg -f image2 -pattern_type glob -i 'frames/*.npg' -vcodec libx264 -q:v 0 -r 24 out.mp4
man ffmpeg
ffmpeg -f image2 -pattern_type glob -i 'frames/*.png' -vcodec libx264 -q:v 0 -r 24 out.mp4
mv out.mp4 eru.mp4
mv frames frames_horz
python -m run_ibr
ffmpeg -f image2 -pattern_type glob -i 'frames_diag/*.png' -vcodec libx264 -q:v 0 -r 24 eru_diag.mp4
ls
lll out_py_ibr/frames/
cd data/2018-05-14_sony/
cd ../2018-07-20_sony/
ls test/
rm -r test
ipython 
vsui
cd data/2018-07-20_sony/frame_tests/000.MP4/120/rast
cd data/2018-07-20_sony/frame_tests/000.MP4/120/raster/

cd ..
cp ~/winhome/Downloads/rectifications-20180718T161305Z-001.zip .
unzip rectifications-20180718T161305Z-001.zip 
rm rectifications-20180718T161305Z-001.zip 
ls rectifications/
lll
lll ~/
python -m run_flow ~/Software/v_suite/v_suite/v_experiments/domains/cellist/cellist_end_to_end.ini 
ls
ll ~/
sudo umount /mnt/d
ll /mnt
vsui
cd Software/v_suite/
conda install -r pre_requirements.txt 
pip install -r pre_requirements.txt 
pip install --upgrade pip
pip install -r requirements.in
