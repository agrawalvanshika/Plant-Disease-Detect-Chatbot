# Plant Disease Detection System - Configuration Guide

## Environment Setup

### Backend Configuration

Create a `.env` file in the backend directory (optional):

```env
# Server Configuration
HOST=0.0.0.0
PORT=8000
DEBUG=False

# CORS Settings
ALLOWED_ORIGINS=*

# Model Paths (relative to backend directory)
IMAGE_MODEL_PATH=models/plant_disease_cnn.pth
TEXT_MODEL_PATH=disease_detection_model
TEXT_ENCODER_PATH=text_label_encoder.joblib
CLASS_NAMES_PATH=image_class_names.json
RECOMMENDATIONS_PATH=disease_recommendations.json
```

## Running the Application

### Development Mode

1. **Start Backend** (from backend directory):
```bash
cd backend
python main.py
```

2. **Access Application**:
   - Open browser: `http://localhost:8000`
   - API Docs: `http://localhost:8000/docs`

### Production Mode

Use uvicorn with multiple workers:

```bash
cd backend
uvicorn main:app --host 0.0.0.0 --port 8000 --workers 4
```

## File Locations

### Backend Files
- `backend/main.py` - Main application
- `backend/models/` - Model files
- `backend/disease_detection_model/` - Text model
- `backend/disease_recommendations.json` - Treatment database

### Frontend Files
- `frontend/index.html` - Main page
- `frontend/css/style.css` - Styles
- `frontend/js/app.js` - JavaScript logic

## Deployment Checklist

- [ ] Install Python dependencies
- [ ] Verify model files exist
- [ ] Configure CORS for production domain
- [ ] Set up SSL/HTTPS (recommended)
- [ ] Configure firewall rules
- [ ] Set up process manager (systemd, supervisor)
- [ ] Configure reverse proxy (nginx, apache)
- [ ] Enable logging
- [ ] Set up monitoring

## Troubleshooting

### Models not loading
- Check file paths in backend directory
- Ensure all model files are present
- Check file permissions

### CORS errors
- Update CORS settings in `main.py`
- Add your domain to allowed origins

### Port already in use
- Change port in `main.py` or use environment variable
- Kill process using the port

### Static files not serving
- Verify frontend directory path
- Check StaticFiles mount point in `main.py`

## Performance Tuning

### For CPU
- Use multiple workers
- Optimize batch size
- Consider model quantization

### For GPU
- Install CUDA-enabled PyTorch
- Set device to 'cuda' in model loading
- Monitor GPU memory usage

## Monitoring

### Health Check Endpoint
```bash
curl http://localhost:8000/health-check
```

### Logs
Check console output for:
- Model loading status
- Request errors
- Performance metrics

## Backup

Important files to backup:
- Model weights (`.pth`, model directory)
- Configuration files (`.json`, `.joblib`)
- User data (if storing predictions server-side)

---

**Configuration Guide - Plant Disease Detection System**
