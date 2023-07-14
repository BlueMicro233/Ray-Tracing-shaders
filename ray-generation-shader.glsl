primary_payload.color = vec4(0.0, 0.0, 0.0, 1.0);
primary_payload.origin = camera.origin.xyz;
primary_payload.direction = direction;
primary_payload.missed = false;

for (int i = 0; i < 16; ++i)
{
    traceRayEXT(
        TLASES[0],                
        gl_RayFlagsNoneEXT,        /* flag */
        0xFF,                      /* cullMask */
        0,                         /* sbtRecordOffset */
        0,                         /* sbtRecordStride */
        0,                         /* missIndex */
        primary_payload.origin, 
        0.01,                      /* Tmin */
        primary_payload.direction, /* direction */
        1.0 / 0.0,                 /* Tmax */
        0                         
    );

    if (primary_payload.missed)
    {
        break;
    }
}
