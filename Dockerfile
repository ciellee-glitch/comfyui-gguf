FROM ciellee78/worker-comfyui-redux:v2
RUN git clone https://github.com/balazik/ComfyUI-PuLID-Flux /comfyui/custom_nodes/ComfyUI-PuLID-Flux && pip install -r /comfyui/custom_nodes/ComfyUI-PuLID-Flux/requirements.txt
RUN python3 -c "c=open('/comfyui/extra_model_paths.yaml').read(); c=c.rstrip()+'\n  pulid: models/pulid/\n' if 'pulid' not in c else c; open('/comfyui/extra_model_paths.yaml','w').write(c)"
