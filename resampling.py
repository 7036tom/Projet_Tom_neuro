from nilearn.image import smooth_img
from nilearn import image
import os

# User variables #
path_toberesampled = "/hpc/banco/dagens.t/Subj1/Masks_Subj1/to_be_resampled"
path_resampled = "/hpc/banco/dagens.t/Subj1/Masks_Subj1/resampled/"
path_target = "/hpc/banco/dagens.t/Subj1/run1/glmwvol0000.nii"

to_be_resized = os.listdir(path_toberesampled)
target = smooth_img(path_target, None)

for path in to_be_resized:
    img= smooth_img(path_toberesampled+path, None)
    resampled = image.resample_to_img(img,target)
    resampled.to_filename(path_resampled+path)
    


