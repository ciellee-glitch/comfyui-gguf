FROM ciellee78/worker-comfyui-redux:v2
RUN comfy-node-install ComfyUI-PuLID-Flux
RUN python3 -c "c=open('/comfyui/extra_model_paths.yaml').read(); c=c.rstrip()+'\n  pulid: models/pulid/\n' if 'pulid' not in c else c; open('/comfyui/extra_model_paths.yaml','w').write(c)"
