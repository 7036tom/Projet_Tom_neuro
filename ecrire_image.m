
cd (Lien_vers_le_dossier_contenant_les_betas)
Contrast_hdr=spm_vol('beta_0001.hdr');
Contrast=spm_read_vols(Contrast_hdr);
%image=zeros(113,135,112);

image=Nom_associe_a_limage_a_ecrire;
Mask_hdr=Contrast_hdr
Mask_hdr.fname=['nom.nii']
V=spm_write_vol(Mask_hdr, image);
    


