FROM ciellee78/worker-comfyui-redux:v2
RUN rm -rf /comfyui/custom_nodes/ComfyUI-PuLID-Flux && git clone https://github.com/balazik/ComfyUI-PuLID-Flux /comfyui/custom_nodes/ComfyUI-PuLID-Flux && pip install -r /comfyui/custom_nodes/ComfyUI-PuLID-Flux/requirements.txt && python3 -c "import re; f='/comfyui/custom_nodes/ComfyUI-PuLID-Flux/pulidflux.py'; c=open(f).read(); c=re.sub(r',\s*providers=\[provider \+ .ExecutionProvider.,\]', '', c); open(f,'w').write(c)"
RUN python3 -c "from insightface.app import FaceAnalysis; FaceAnalysis(name='antelopev2', root='/comfyui/models/insightface')"
RUN python3 -c "c=open('/comfyui/extra_model_paths.yaml').read(); c=c.rstrip()+'\n  pulid: models/pulid/\n' if 'pulid' not in c else c; open('/comfyui/extra_model_paths.yaml','w').write(c)"
